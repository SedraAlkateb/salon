import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/di.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/user/appointment/bloc/appointment_bloc.dart';
class DrawerAdmin1View extends StatelessWidget {
  const DrawerAdmin1View({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
backgroundColor: ColorManager.white,
      child: ListView(
          children: [
            Image.asset(ImageAssets.login),
            ListTile(
                title: const Text("Services Manager"),
                leading: Icon(Icons.home_repair_service_sharp,
                  color: ColorManager.secondaryColor,
                ),

                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.services,(route) => false,);
                }

            ),
            Divider(
              color: ColorManager.secondaryColor,
              height: 20,
            ),
            ListTile(
              title: const Text("Products Manager"),
                leading: Icon(Icons.production_quantity_limits,
                  color: ColorManager.secondaryColor,
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.products,(route) => false,);
                }

            ),
            Divider(
              color: ColorManager.secondaryColor,

              height: 20,
            ),
            ListTile(
                title: const Text("Employees Manager"),
                leading: Icon(Icons.people,
                  color: ColorManager.secondaryColor,

                ),

                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.employees,(route) => false,);
                }

            ),
            Divider(
              color: ColorManager.secondaryColor,

              height: 20,
            ),
            ListTile(
                title: const Text("Appointment Manager"),
                leading: Icon(Icons.people,
                  color: ColorManager.secondaryColor,

                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.appointments);
                  BlocProvider.of<AppointmentBloc>(context).add(AllAppointment());
                }
            ),
            Divider(
              color: ColorManager.secondaryColor,
              height: 20,
            ),

            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is LogoutLoadingState){
                  loading(context);
                }
                if(state is LogoutErrorState){
                  error(context,state.failure.massage,state.failure.code);
                }
                if(state is LogoutState){
                  Navigator.pushNamedAndRemoveUntil(
                    context, Routes.loginPage, (route) => false,);
                }
              },
              child: ListTile(
                  title: const Text("Logout"),
                  leading: Icon(Icons.logout,
                    color: ColorManager.secondaryColor,
                  ),

                  onTap: () async {
                    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                  }

              ),
            ),

          ],
        ),


      );

  }
}
