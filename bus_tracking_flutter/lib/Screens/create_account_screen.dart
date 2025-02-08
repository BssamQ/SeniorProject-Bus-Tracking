import 'package:bus_tracking_client/bus_tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';


class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      final client = Client('http://localhost:8080/')
        ..connectivityMonitor = FlutterConnectivityMonitor();

      /*final client = Client('http://localhost:56734/')
        ..connectivityMonitor = FlutterConnectivityMonitor();*/


      final user = User(
        name: _name,
        email: _email,
        password: _password,
        role: 'student', // Default role
      );

      try {
        final result = await client.user.addUser(user);
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account created successfully')),
          );
          Navigator.pop(context); // Go back to login screen
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to create account')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A3D2F),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/kfupm_logo1.png", height: 80),
                SizedBox(height: 10),
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _name = value!,
                        ),
                        SizedBox(height: 15),
                        Text('KFUPM E-Mail'),
                        SizedBox(height: 5),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'xxxxxx@kfupm.edu.sa',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[a-zA-Z0-9]+@kfupm\.edu\.sa$').hasMatch(value)) {
                              return 'Please enter a valid KFUPM email';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value!,
                        ),
                        SizedBox(height: 15),
                        Text('Password'),
                        SizedBox(height: 5),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value!,
                        ),
                        SizedBox(height: 15),
                        Text('Confirm Password'),
                        SizedBox(height: 5),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Re-enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                          onSaved: (value) => _confirmPassword = value!,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A3D2F),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Create Account',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
