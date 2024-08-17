import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as d;

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // متغير لتخزين المتحكم بالخريطة لاستخدامه لاحقًا
    GoogleMapController? _controller;

    // دالة لاستدعاء عند إنشاء الخريطة
    void _onMapCreated(GoogleMapController controller) {
      _controller = controller;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                size: AppSize.s30,
                Icons.arrow_back,
                color: ColorManager.secondaryColor,
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
      body: d.BlocConsumer<SalonBloc, SalonState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          Set<Marker> markers = {
            Marker(
              markerId: MarkerId(LatLng(33.515343,36.289590).toString()),
              position: LatLng(33.515343,36.289590),
              infoWindow: InfoWindow(
                title: "locationName",
              ),
            ),
          };
          if (state is AddLocationState) {
            markers = state.marker ;
            Navigator.pop(context);
          }
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(33.515343, 36.289590),
              zoom: 14.4746,
            ),
            onTap: (position) {
              // إضافة الموقع عند النقر على الخريطة
              d.BlocProvider.of<SalonBloc>(context).add(
                AddLocationSalonEvent(position.latitude, position.longitude),
              );
            },
            markers: markers,
          );
        },
      ),
    );
  }
}
