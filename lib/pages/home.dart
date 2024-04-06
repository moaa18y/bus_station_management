import 'package:flutter/material.dart';
import 'package:select_searchable_list/select_searchable_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final Map<int, String> _from = {
    1: 'Zahraa Nasr City, Cairo Governorate',
    2: 'Al-Salam, Cairo Governorate',
    3: 'Al-Marj, Cairo Governorate',
    4: 'Al-Munib, Giza Governorate',
    5: 'Beni suef Governorate',
    6: 'Faiyum Governorate',
    7: 'Al-Haram, Giza Governorate',
    8: 'Helwan, Cairo Governorate',
    9: 'Saqr Quraysh, Cairo Governorate',
    10: 'Al-Rehab, New Cairo'
  };
  final Map<int, String> _to = {
    1: 'Zahraa Nasr City, Cairo Governorate',
    2: 'Al-Salam, Cairo Governorate',
    3: 'Al-Marj, Cairo Governorate',
    4: 'Al-Munib, Giza Governorate',
    5: 'Beni suef Governorate',
    6: 'Faiyum Governorate',
    7: 'Al-Haram, Giza Governorate',
    8: 'Helwan, Cairo Governorate',
    9: 'Saqr Quraysh, Cairo Governorate',
    10: 'Al-Rehab, New Cairo'
  };
  final List<int> _selectedFrom = [1];
  final List<int> _selectedto = [1];
  final TextEditingController _fromTextEditingController =
      TextEditingController();
  final TextEditingController _toTextEditingController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _fromTextEditingController.dispose();
    _toTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.01, -1.00),
                    end: Alignment(-0.01, 1),
                    colors: [Color(0xFFE6F7FA), Color(0x00D9D9D9)],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 186,
              child: Container(
                width: 170,
                height: 30,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topLeft,
                    scale: 1,
                    image: AssetImage("assets/images/StationLink.png"),
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 245,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 340,
                    height: 25,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 144,
                          height: 27,
                          child: Text(
                            "Book Trip",
                            style: TextStyle(
                              color: Color(0xFFFF5B33),
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              height: 0.08,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 340,
                    height: 302,
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19212121),
                          blurRadius: 16,
                          offset: Offset(0, 12),
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Color(0x11212121),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          spreadRadius: -2,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              DropDownTextField(
                                textEditingController:
                                    _fromTextEditingController,
                                title: 'From (Current Station)',
                                hint: 'Select Station',
                                options: _from,
                                selectedOptions: _selectedFrom,
                                onChanged: (selectedIds) {},
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              DropDownTextField(
                                textEditingController: _toTextEditingController,
                                title: 'To (Destination Station)',
                                hint: 'Select Station',
                                options: _to,
                                selectedOptions: _selectedto,
                                onChanged: (selectedIds) {},
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/microbus");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.fromLTRB(
                                          70, 10, 70, 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: const Color(0xff00ADCF)),
                                  child: const Text(
                                    'Search For Trips',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
