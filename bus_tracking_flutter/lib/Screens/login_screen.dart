import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import '../home_screen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/26H0W9d2/9bb56f68-b4a8-46d2-a5f3-bd31dac6b840.png',
              fit: BoxFit.cover,
              alignment: const Alignment(-0.7, 0),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 25, // Standard status bar height (can adjust)
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5) // Dark mode: dark gray semi-transparent
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/ar/archive/3/37/20221103091849%21King_Fahd_University_of_Petroleum_%26_Minerals_Logo.png',
                    height: 175,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'BUS SYSTEM',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Theme(
                          data: Theme.of(context).copyWith(
                            elevatedButtonTheme: ElevatedButtonThemeData(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF003E51), // custom dark blue
                                foregroundColor: Colors.white, // white text
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          child: SignInWithEmailButton(
                            caller: client.modules.auth,
                            onSignedIn: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF008540), // white button
                            foregroundColor: const Color(0xFFFFFFFF), // dark text
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: const Text('Skip Login'),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
