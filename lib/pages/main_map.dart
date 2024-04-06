import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final Location _location = Location();
  LatLng _userLocation = const LatLng(30.045761420660106,
      31.38068750004098); // Initialize with default location
  final LatLng _destinationLocation = const LatLng(
      30.045761420660106, 31.38068750004098); // Example destination location
  final Set<Polyline> _polylines = {}; // Store the polylines

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final locationData = await _location.getLocation();
    setState(() {
      _userLocation = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _mapController!.animateCamera(CameraUpdate.newLatLng(
        _userLocation)); // Set camera position to user's current location
  }

  Future<void> _drawRoute() async {
    if (!await _location.serviceEnabled()) {
      final bool serviceStatus = await _location.requestService();
      if (!serviceStatus) {
        print('Location services are disabled.');
        return;
      }
    }
    await Future.delayed(const Duration(seconds: 2));

    // Create a Polyline object
    final Polyline polyline = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.blue,
      points: [_userLocation, _destinationLocation],
    );

    // Add the Polyline to the set
    setState(() {
      _polylines.add(polyline);
    });
    // Move the camera to show both user and destination
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Show Direction',
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
            Navigator.pushNamed(context, "/ticket_download");
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GoogleMap(
        cameraTargetBounds: CameraTargetBounds(LatLngBounds(
            southwest: const LatLng(30.044563370151725, 31.372447754339312),
            northeast: const LatLng(30.047553825717674, 31.389334941345865))),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _userLocation,
          bearing: 0.0,
          tilt: 0.0,
          zoom: 17,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('user'),
            position: _userLocation,
            infoWindow: const InfoWindow(title: 'User Location'),
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: _destinationLocation,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen), // Custom marker icon

            infoWindow: const InfoWindow(title: 'Destination'),
          ),
        },
        polylines: _polylines, // Display the stored polylines
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 50),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: _drawRoute,
          child: const Icon(
            Icons.directions,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
