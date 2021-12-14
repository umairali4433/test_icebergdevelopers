import 'package:flutter/material.dart';
import 'package:test_icebergdevelopers/HomeScreen/Homescreen.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.green,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white)

            )
        ),
        title: 'Abaya',
          home:   Homescreen(),
      ));
}

