import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onstaraapplication/home_screen/home_screen.dart';
// import 'package:onstaraapplication/new.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentication/login_form.dart';
import 'firebase_options.dart';
import 'homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      runApp(const MaterialApp(
        //here given the name=============>
        home: SignIn(),
        //HomeScreen ()
        debugShowCheckedModeBanner: false,
      ));
    } else {
      runApp(const MaterialApp(
        home:HomeScreen(),
        debugShowCheckedModeBanner: false,
      ));
    }
  });
   // just an example
}

