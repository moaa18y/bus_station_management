import 'package:flutter/material.dart';

//start 2

class Start2 extends StatelessWidget {
  const Start2({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
           resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "/st3");
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xffFFFFFF),
                size: 23,
              ),
            ),
            body: Center(
              child: Container(
                width: double.maxFinite,
                height: 812,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 39,
                      top: 725,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF00ADCF),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFCCCCCC),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFCCCCCC),
                              shape: OvalBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      left: 39,
                      top: 550,
                      child: SizedBox(
                        height: 102,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 235,
                              child: Text(
                                'Efficiency',
                                style: TextStyle(
                                  color: Color(0xFFFF5B33),
                                  fontSize: 32,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 299,
                              child: Text(
                                'Reducing manual processes and human errors.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  letterSpacing: 0.15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
