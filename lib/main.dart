import 'package:flutter/material.dart';
import 'package:tt/pages/homepage.dart';
import 'package:tt/pages/microbus.dart';
import 'package:tt/pages/start2.dart';
import 'package:tt/pages/start3.dart';
import 'package:tt/pages/start4.dart';
import 'package:tt/pages/zonechecker.dart';
import 'package:tt/pages/login.dart';
import 'package:tt/pages/signup.dart';
import 'package:tt/pages/map.dart';
import 'package:tt/pages/start1.dart';
import 'package:tt/pages/main_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/homepage",
      routes: {
        "/st1": (context) => const Start1(),
        "/st2": (context) => const Start2(),
        "/st3": (context) => const Start3(),
        "/st4": (context) => const Start4(),        
        "/login": (context) => const Login(),
        "/signup": (context) => const Signup(),
        "/map": (context) => const Map(),
        "/main_map": (context) => const MapScreen(),
        "/zonechecker": (context) => const ZoneChecker(),
        "/microbus": (context) => const MicrobusListPage(),
        "/homepage": (context) => const HomePage(),


      },
    );
  }
}
