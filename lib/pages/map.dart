import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tt/pages/location_helper.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  Future<void> getCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocationCameraPosition,
      //      zoomControlsEnabled: false,
      //      onMapCreated: (GoogleMapController googleMapController) {},
      //      markers: Set.of(_marker),
      //      polylines: Set.of(_polyLine),
      //      circles: myCircles,
      //      cameraTargetBounds: CameraTargetBounds(LatLngBounds(
      //          southwest: const LatLng(30.044563370151725, 31.372447754339312),
      //          northeast: const LatLng(30.047553825717674, 31.389334941345865))),
      //     initialCameraPosition: _myCurrentLocation,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }
  //var myMarkers = HashSet<Marker>();
  // final List<Marker> _marker = [];
  // final List<Polyline> _polyLine = [];

  // final List<Marker> _list = const [
  //   Marker(
  //       markerId: MarkerId('1'),
  //       position: LatLng(30.045761420660106, 31.38068750004098),
  //       infoWindow: InfoWindow(
  //         title: 'Station',
  //       )),
  //   Marker(
  //       markerId: MarkerId('2'),
  //       position: LatLng(30.048993298566582, 31.38047292338011),
  //       infoWindow: InfoWindow(
  //         title: 'Location 1',
  //       )),
  //   Marker(
  //       markerId: MarkerId('3'),
  //       position: LatLng(30.044749115320666, 31.378659750065943),
  //       infoWindow: InfoWindow(
  //         title: 'Location 2',
  //       )),
  //   Marker(
  //       markerId: MarkerId('4'),
  //       position: LatLng(30.040560476189203, 31.378284240922948),
  //       infoWindow: InfoWindow(
  //         title: 'Location 3',
  //       )),
  // ];
  // final List<Polyline> _listt = const [
  //   Polyline(
  //     polylineId: PolylineId('1'),
  //     color: Colors.blue,
  //     width: 4,
  //     points: [
  //       LatLng(30.045761420660106, 31.38068750004098),
  //       LatLng(30.048993298566582, 31.38047292338011),
  //     ],
  //   ),
  //   Polyline(
  //     polylineId: PolylineId('2'),
  //     color: Colors.blue,
  //     width: 4,
  //     points: [
  //       LatLng(30.045761420660106, 31.38068750004098),
  //       LatLng(30.044749115320666, 31.378659750065943),
  //     ],
  //   ),
  //   Polyline(
  //     polylineId: PolylineId('3'),
  //     color: Colors.blue,
  //     width: 4,
  //     points: [
  //       LatLng(30.045761420660106, 31.38068750004098),
  //       LatLng(30.040560476189203, 31.378284240922948),
  //     ],
  //   ),
  // ];
  // Set<Circle> myCircles = {
  // Circle(
  //   circleId: const CircleId('1'),
  //   fillColor: Colors.grey.withOpacity(0.4),
  //   center: const LatLng(30.045761420660106, 31.38068750004098),
  //   radius: 500,
  //   strokeWidth: 1,
  // )
  // };
  // @override
  // void initState() {
  //   super.initState();
  //   _marker.addAll(_list);
  //   _polyLine.addAll(_listt);
  // }
  Future<void> _goToMyCurrentLoction() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Map test',
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
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: _goToMyCurrentLoction,
          child: const Icon(
            Icons.gps_fixed,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
