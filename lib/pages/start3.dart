import 'package:flutter/material.dart';

//start 3
class Start3 extends StatelessWidget {
  const Start3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            Navigator.pushNamed(context, "/st4");
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Color(0xffFFFFFF),
            size: 23,
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 358,
                child: Container(
                  width: 400,
                  height: 454,
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
                left: 357,
                top: 710,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(3.14),
                  child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Stack(children: []),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                        color: Color(0xFFcccccc),
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
                          'Time-Saving',
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
                          'No more waiting in long queues.',
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
        ));
  }
}
