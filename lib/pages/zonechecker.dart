import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tt/pages/main_map.dart';

class ZoneChecker extends StatefulWidget {
  const ZoneChecker({super.key});

  @override
  _ZoneCheckerState createState() => _ZoneCheckerState();
}

class _ZoneCheckerState extends State<ZoneChecker> {
  final LatLng zoneCenter =
      const LatLng(30.045761420660106, 31.38068750004098); // zone center
  final double zoneRadius = 500; // zone radius in meters

  void _checkLocationAndNavigate() async {
    bool isInsideZone = await _isWithinZone();
    if (isInsideZone) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapScreen()),
      );
    } else {
      _showNotInZoneDialog();
    }
  }

  Future<bool> _isWithinZone() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double distance = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      zoneCenter.latitude,
      zoneCenter.longitude,
    );
    return distance <= zoneRadius;
  }

  void _showNotInZoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Unavailable'),
          content: const Text(
              'You cannot book now!! \nbecause you\'re not inside the zone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zone Checker'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _checkLocationAndNavigate,
          child: const Text('Book Now'),
        ),
      ),
    );
  }
}
