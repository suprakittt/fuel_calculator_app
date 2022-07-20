import 'package:driving_app/map/Map_view.dart';
import 'package:driving_app/third_screen.dart';
import 'package:driving_app/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'UsersAccount/login_screen.dart';
import 'UsersAccount/register_screen.dart';
import 'homepage.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),
      // home: MapView(),
      //home: WelcomeWidget(),
        //home: LoginScreen(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WelcomeWidget();
          } else {
            return LoginScreen();
          }
        }
    )// home: CalculationWidget(index: 10),
    );

  }
}
