import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:salon/app/di.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/user/appointment/bloc/appointment_bloc.dart';
import 'package:salon/presentation/user/card_user/bloc/card_bloc.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
import 'package:salon/presentation/user/user_home/pages/book_service_user.dart';
import 'package:salon/presentation/user/user_home/pages/product_user.dart';
import 'package:salon/presentation/user/user_home/pages/salon_user.dart';
import 'package:salon/presentation/user/user_home/pages/service_user.dart';
import 'package:salon/presentation/user/user_home/widgets/menu_list.dart';
class NavPage extends StatelessWidget {

 final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> bodyList = [  ProductUser(), ServiceUser(),SalonUser()];
  final List<String> appBarTitle = [
    "All Product",
    "All Service",
    "All Salon",
  ];


  NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    if(context.read<UserNavBloc>().isBuild){
      BlocProvider.of<UserNavBloc>(context).add(AllProduct());
      context.read<UserNavBloc>().isBuild=false;
    }


    return SafeArea(
        child: Scaffold(
            appBar: context.read<UserNavBloc>().index > 5
                ? null
                : AppBar(
              backgroundColor: ColorManager.secondaryColor,
              leading:   MenuList(),
              title: Text(appBarTitle[context.read<UserNavBloc>().index],
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
                textAlign: TextAlign.center,),
              actions: [
                context.read<UserNavBloc>().index==0?
                    IconButton(onPressed: (){
                      initCardModule();
                      Navigator.pushNamed(context, Routes.cards);
                      BlocProvider.of<CardBloc>(context).add(AllCard());
                    }, icon:Icon( Icons.shopping_cart,color: ColorManager.primary6,size: 30)):SizedBox(),
                context.read<UserNavBloc>().index==1?
                IconButton(onPressed: (){
                  initAppointmentModule();
                  Navigator.pushNamed(context, Routes.cards);
                  BlocProvider.of<AppointmentBloc>(context).add(AllAppointment());
                },
                    icon:
                    Icon(Icons.app_registration ,color: Colors.white,weight: 15)
                )
                    :SizedBox(),

              ],
            ),
            bottomNavigationBar: _buildBottomNavBar(context),
            backgroundColor: ColorManager.white,
            body: BlocListener<UserNavBloc, UserNavState>(
                listener: (context, state) {},
                child: bodyList[context.watch<UserNavBloc>().index])));
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: context.read<UserNavBloc>().index,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.dashboard_rounded,color: Colors.white,weight: 15),
            Icon(Icons.home_repair_service_sharp,color: Colors.white,weight: 15),
            Icon(Icons.account_balance_outlined ,color: Colors.white,weight: 15),

          ],

          onTap: (index) {
            BlocProvider.of<UserNavBloc>(context).add(ChangeTapNav(index: index));
            index==0?
            BlocProvider.of<UserNavBloc>(context).add(AllProduct()):
            index==1?
            BlocProvider.of<UserNavBloc>(context).add(AllService()):
            BlocProvider.of<UserNavBloc>(context).add(AllSalon())
            ;
          },
          buttonBackgroundColor: ColorManager.secondaryColor,
          backgroundColor: Colors.white,
          color: ColorManager.secondaryColor,

          //animationCurve: Curves.linear,
        )
    );
  }
}

/*
 BottomNavyBar(
          backgroundColor: whiteColor,
          curve: Curves.easeIn,
          itemCornerRadius: 100,
          iconSize: 20,
          showElevation: true,
          selectedIndex: context.read<UserNavBloc>().index,
          onItemSelected: (index) {
            BlocProvider.of<UserNavBloc>(context).add(ChangeTapNav(index: index));
            print(index);

            //setState(() => _selectedIndex = index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: primaryColor,
              inactiveColor: secondaryColor,
              title: Text(
                LocaleKeys.UserNav_page.tr(),
                style: TextStyle(color: secondaryColor),
              ),
              icon: Icon(Icons.UserNav_outlined, color: primaryColor),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              activeColor: primaryColor,
              inactiveColor: primaryColor,
              title: Text(
                LocaleKeys.profile_page.tr(),
                style: TextStyle(color: secondaryColor),
              ),
              icon: Icon(Icons.person, color: primaryColor),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              activeColor: primaryColor,
              inactiveColor: primaryColor,
              title: Text(
                LocaleKeys.setting_page.tr(),
                style: TextStyle(color: secondaryColor),
              ),
              icon: Icon(Icons.settings, color: primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        )
 */
