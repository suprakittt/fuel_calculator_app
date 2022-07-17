import 'package:driving_app/UsersAccount/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../welcome_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: const Text('Login'),
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if (user != null){
                    print("$email is in.");
                    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => WelcomeWidget()));
                    
                  } else{
                    print("Login failed");
                  }
                } catch (e) {
                  print(e);
                }
              }),
          TextButton(
            child: const Text('Register'),
            onPressed: () {
              print('register');
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
          ),
        ],
      ),
    );
  }
}