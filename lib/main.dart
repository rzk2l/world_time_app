import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';
import 'package:world_time_app/Pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => LoadingScreen(),
      '/home':(context) => HomeScreen(),
      '/location':(context) => ChooseLocation(),
    },
  ));
}


