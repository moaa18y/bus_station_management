import 'dart:async';
import 'package:flutter/material.dart';

class TicketSummaryPage extends StatefulWidget {
  const TicketSummaryPage({super.key});

  @override
  _TicketSummaryPageState createState() => _TicketSummaryPageState();
}

class _TicketSummaryPageState extends State<TicketSummaryPage> {
  Timer? _timer;
  Duration _duration = const Duration(minutes: 5);

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration -= const Duration(seconds: 1);
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Ticket Summary',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/microbus");
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 4.0,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const ListTile(
                leading: Icon(Icons.directions_bus),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Text('Microbus 1'),
                    Text('From:' '\t\tZahraa Nasr City Station'),
                    Text('To:' '\t\tAl-Mokattam, Cairo Governorate'),
                    Text('1 Ticket, Mini Bus'),
                    Text('Plate number: ' '1456 أ ت ن'),
                    Text('Passenger Number: 9'),
                    Text('Date: ' 'Monday, 27 Dec 2023'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Card(
              elevation: 4.0,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const ListTile(
                leading: Icon(Icons.attach_money),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Text('Ticket Value: 25 EGP'),
                    Text('Total Amount: 25 EGP'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Card(
              elevation: 4.0,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Colors.blue,
                      title: const Text(
                          'I agree on Terms and Conditions of StationLink',
                          style: TextStyle(fontSize: 14)),
                      value: false,
                      onChanged: (bool? value) {
                        Navigator.pushNamed(context, "/terms_conditions");
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Available Time to book',
                        style: TextStyle(fontSize: 14)),
                    Text(
                      '${_duration.inMinutes.toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color:
                            _duration.inSeconds > 0 ? Colors.blue : Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, "/payment");
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: const Color(0xff00ADCF)),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
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
    );
  }
}
