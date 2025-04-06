import 'package:flutter/material.dart';

import 'Screens/AdminDash.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Student Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminMain()),
                );
              },
              child: const Text('Admin Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/driver');
              },
              child: const Text('Driver Page'),
            ),
          ],
        ),
      ),
    );
  }
}

//testing
