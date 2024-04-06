import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//start 1
class Start1 extends StatefulWidget {
  const Start1({super.key});
  @override
  State<Start1> createState() => _Start1State();
}

class _Start1State extends State<Start1> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/st2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF00ADCF), Color(0xFF00ADCF)])),
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  scale: 1.5,
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            )),
      ),
    );
  }
}
