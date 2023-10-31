import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition KGooqlePlex = const CameraPosition(
    target: LatLng(32.5012532, 74.4981116),
    zoom: 14,
  );

  List<Marker> _marker=[];
  final List<Marker> _list=const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(32.5012532, 74.4981116),
        infoWindow: InfoWindow(
          title: 'My Current Location'
        ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng( 32.5232139833, 74.5267659933),
      infoWindow: InfoWindow(
          title: 'Ghanta Ghar'
      )
    )
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:KGooqlePlex,
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: false,
        onMapCreated:(GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
