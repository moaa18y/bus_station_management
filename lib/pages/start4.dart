import 'package:flutter/material.dart';

//start 4
class Start4 extends StatelessWidget {
  const Start4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 279,
                child: Container(
                  width: 400,
                  height: 534,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [Colors.black.withOpacity(0), Colors.black],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 688,
                child: SizedBox(
                  width: 339,
                  height: 48,
                  child: Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.fromLTRB(125, 10, 125, 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff00ADCF)),
                          child: const Text(
                            'Start Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 658,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(width: 4),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF00ADCF),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 39,
                top: 530,
                child: SizedBox(
                  height: 75,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Convenience',
                        style: TextStyle(
                          color: Color(0xFFFF5B33),
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 2,
                          letterSpacing: 0.25,
                        ),
                      ),
                      SizedBox(
                        width: 292,
                        child: Text(
                          'Quick and easy digital ticket.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
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
        ));
  }
}
