import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _currentLatLng;
  final Set<Marker> _markers = {};

  static const CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-23.55052, -46.633308), // São Paulo como fallback
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Serviços de localização desativados
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final latLng = LatLng(pos.latitude, pos.longitude);
      setState(() {
        _currentLatLng = latLng;
        _markers.clear();
        _markers.add(Marker(markerId: const MarkerId('me'), position: latLng));
      });

      final controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));
    } catch (e) {
      // ignore errors for now
    }
  }

  Future<void> _centerToCurrent() async {
    if (_currentLatLng == null) {
      await _initLocation();
      return;
    }
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(_currentLatLng!, 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa - Minha localização')),
      body: GoogleMap(
        initialCameraPosition: _currentLatLng == null ? _initialCamera : CameraPosition(target: _currentLatLng!, zoom: 16),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          if (!_controller.isCompleted) _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _centerToCurrent,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
