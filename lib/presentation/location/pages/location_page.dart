import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';


class LocationPage extends StatelessWidget {
  const LocationPage({super.key,required this.center});
  final LatLng center;
  void _onMapCreated(GoogleMapController controller) {
    GoogleMapController _controller;
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    String locationName = 'My Location';

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: ColorManager.primary,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                size: AppSize.s30,
                Icons.arrow_back,
                color: ColorManager.secondaryColor, // هنا يمكنك تحديد لون الأيقونة
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        actions: [
          Image.asset(ImageAssets.login),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: center, // استخدام LatLng من الكونستركتر
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId(center.toString()),
            position: center,
            infoWindow: InfoWindow(
              title: locationName,
              snippet: center.toString(),
            ),
          ),
        },
      ),
    );
  }
}

