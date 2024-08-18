import 'package:salon/app/constants.dart';
import 'package:salon/app/di.dart';
import 'package:salon/app/user_info.dart';
import 'package:flutter/material.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/product/bloc/product_bloc.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/them_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/user/appointment/bloc/appointment_bloc.dart';
import 'package:salon/presentation/user/card_user/bloc/card_bloc.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    initLoginModule();
    return MultiBlocProvider(
      providers: [
      BlocProvider(
          create: (_) => instance<AuthBloc>()
      ),
        BlocProvider(
            create: (_) => instance<HomeAdminBloc>()
        ),
        BlocProvider(
            create: (_) => instance<SalonBloc>()
        ),
        BlocProvider(
            create: (_) => instance<ServiceBloc>()
        ),
        BlocProvider(
            create: (_) => instance<ProductBloc>()
        ),
        BlocProvider(
            create: (_) => instance<EmployeeBloc>()
        ),
        BlocProvider(
            create: (_) => instance<UserNavBloc>()
        ),
        BlocProvider(
            create: (_) => instance<CardBloc>()
        ),
        BlocProvider(
            create: (_) => instance<AppointmentBloc>()
        ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner:false,
      onGenerateRoute: RouteGenerator.getRoute,
       initialRoute:UserInfo.isLogging==false?Routes.loginPage:
       (Constants.type==0?
       Routes.homeAdmin :Constants.type==1?
      Routes.services: Routes.userNav ),
      theme: getApplicationTheme(),
    ),

    );
  }

}
