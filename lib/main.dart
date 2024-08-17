import 'package:flutter/material.dart';
import 'package:salon/app/app.dart';
import 'package:salon/app/app_preferences.dart';
import 'package:salon/app/di.dart';
import 'package:salon/app/user_info.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  AppPreferences sharedPreferences =  AppPreferences(instance());
  UserInfo.isLogging=await sharedPreferences.isUserLoggedIn();
  runApp(const MyApp());
}