import 'package:flutter/material.dart';
import 'package:tt/pages/login.dart';
import 'package:tt/pages/signup.dart';
import 'package:tt/pages/map.dart';
import 'package:tt/pages/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/map",
      routes: {
        "/login": (context) => const Login(),
        "/map": (context) => const Map(),
        "/signup": (context) => const Signup(),
        "/test": (context) => const Test(),
      },
    );
  }
}
