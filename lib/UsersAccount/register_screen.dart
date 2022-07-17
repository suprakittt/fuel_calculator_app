import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            onChanged: (value) {
              email = value;
            },
            decoration: const InputDecoration(
              hintText: 'email',
            ),
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: const InputDecoration(
              hintText: 'password',
            ),
          ),
          TextButton(
              child: const Text('create account'),
              onPressed: () async {
                //print("create account with $email , $password");
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => LoginScreen()));
                } catch (e) {
                  print(e);
                }
              }),
        ],
      ),
    );
  }
}