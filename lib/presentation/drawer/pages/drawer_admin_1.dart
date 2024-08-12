import 'package:flutter/material.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
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
              title: const Text("profile"),
              leading: Icon(
                Icons.person, color: ColorManager.secondaryColor,),

              onTap: () {
     //           Navigator.pushNamedAndRemoveUntil(context, Routes.profileRoute,(route) => false,);

              },
            ),
            Divider(
              color: ColorManager.secondaryColor,
              height: 20,
            ),
            ListTile(
                title: const Text("Logout"),
                leading: Icon(Icons.logout,
                  color: ColorManager.secondaryColor,
                ),

                onTap: () async {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.loginPage,(route) => false,);

                }

            ),

          ],
        ),


      );

  }
}
