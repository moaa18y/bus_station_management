import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MicrobusListPage extends StatefulWidget {
  const MicrobusListPage({super.key});

  @override
  _MicrobusListPageState createState() => _MicrobusListPageState();
}

class _MicrobusListPageState extends State<MicrobusListPage> {
  List<Microbus> microbuses = [
    Microbus('Microbus 1', true, 10, 15, 'Zahraa Nasr City', 'Al-Marj City',
        50.0, 'ع س ب 1456'),
    Microbus('Microbus 2', false, 0, 15, 'Zahraa Nasr City', 'Al-Marj City',
        50.0, 'ب ج ه 1111'),
    Microbus('Microbus 3', true, 8, 15, 'Zahraa Nasr City', 'Al-Marj City',
        50.0, 'ا ن ع 8679'),
    Microbus('Microbus 4', false, 0, 15, 'Zahraa Nasr City', 'Al-Marj City',
        50.0, '7584 ن ب ث'),
    // Add more microbuses here
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationService();
  }

  Future<void> _checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Location Service Disabled'),
            content:
                const Text('Please enable location services to use this app.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Enable'),
                onPressed: () {
                  Geolocator.openLocationSettings();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/home");
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Available Microbuses',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
        itemCount: microbuses.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    microbuses[index].isAvailable ? Colors.green : Colors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: microbuses[index].isAvailable
                                  ? Colors.green
                                  : Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            microbuses[index].isAvailable
                                ? 'Available'
                                : 'Waiting',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: microbuses[index].isAvailable
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                      title: Text(
                        microbuses[index].name,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF003D48),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'From: ${microbuses[index].from} \nTo: ${microbuses[index].destination}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF003D48),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Available Seats: ${microbuses[index].availableSeats}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF003D48),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          Text(
                            'Plate Number: ${microbuses[index].plateNumber}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF003D48),
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${microbuses[index].price.toStringAsFixed(2)} EGP',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF00ADCF),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: microbuses[index].isAvailable
                              ? () {
                                  // Handle booking logic
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Microbus {
  String name;
  bool isAvailable;
  int availableSeats;
  int totalSeats;
  String from;
  String destination;
  double price;
  String plateNumber;

  Microbus(this.name, this.isAvailable, this.availableSeats, this.totalSeats,
      this.from, this.destination, this.price, this.plateNumber);
}
