import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p8),
      child: BlocListener<AuthBloc, AuthState>(
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
        child: PopupMenuButton<String>(
          color: ColorManager.white,
          onSelected: (String result) {
            switch (result) {
              case "1":
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
              case "2":
              //      Navigator.pushNamed(context, Routes.changePassword );
            }
          },
          icon: Icon(Icons.menu, color: ColorManager.primary6, size: 35,),
          itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: '1',
              child: Text('Logout'),
            ),
            const PopupMenuDivider(height: 0.1,),
            const PopupMenuItem<String>(
              value: '2',
              child: Text('change password'),
            ),
            const PopupMenuDivider(height: 0.1,),
            const PopupMenuItem<String>(
              value: '3',
              child: Text('Arabic'),
            ),
          ],
        ),
      ),
    );
  }
}
