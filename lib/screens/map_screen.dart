import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:habitus/reusable_widgets/widgets.dart';
import 'package:habitus/main/constants.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(), drawer: HomeDrawer(), body: MapWidget());
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  MapState createState() => MapState();
}

class MapState extends State<MapWidget> {
  final LatLng currentLocation = const LatLng(53.3490, -6.2600); // Dublin
  final List<LatLng> gyms = [
    const LatLng(53.3478, -6.2597),
    const LatLng(53.3438, -6.2546),
    const LatLng(53.3500, -6.2665),
    const LatLng(53.3452, -6.2670),
  ];
  int gymSessionCount = 0;
  final Distance distance = const Distance();

  void _logGymSession() {
    final nearby = gyms.any(
        (gym) => distance.as(LengthUnit.Meter, currentLocation, gym) < 100);

    if (nearby) {
      setState(() {
        gymSessionCount += 1;
      });
      _showBottomSheet(
        icon: AppImages.tickImage,
        message: "Gym session logged successfully!",
        success: true,
      );
    } else {
      _showBottomSheet(
        icon: null,
        message:
            "Try moving closer to your target location to log a gym session.",
        success: false,
      );
    }
  }

  void _showBottomSheet(
      {String? icon, required String message, required bool success}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (success && icon != null)
              Image.asset(icon, width: 48, height: 48),
            if (!success) const Icon(Icons.location_off, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: currentLocation,
            initialZoom: 16.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                // Current Location Marker
                Marker(
                  width: 20,
                  height: 20,
                  point: currentLocation,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // Gym Markers
                ...gyms.map((gym) => Marker(
                      width: 40,
                      height: 40,
                      point: gym,
                      child: Image.asset(
                        'assets/images/pin.png',
                        width: 36,
                        height: 36,
                      ),
                    )),
              ],
            ),
          ],
        ),
        Positioned( // Floating Action Log Button
          bottom: 24,
          right: 24,
          child: FloatingActionButton.extended(
            backgroundColor: const Color(0xFF20A7DB),
            onPressed: _logGymSession,
            icon: const Icon(Icons.fitness_center, color: Colors.white),
            label: const Text('Log', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
