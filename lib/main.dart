import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bind.dart';
import 'screen/Login_screen.dart';

void main() {
  Bind().dependencies();
  runApp(
    GetMaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff17a2d0),
        primarySwatch: const MaterialColor(0xff17a2d0,{50: Color( 0xffe8f7fc )
        , 100: Color( 0xffd1f0fa )
        , 200: Color( 0xffa3e1f5 )
        , 300: Color( 0xff75d1f0 )
        , 400: Color( 0xff47c2eb )
        , 500: Color( 0xff19b3e6 )
        , 600: Color( 0xff148fb8 )
        , 700: Color( 0xff0f6b8a )
        , 800: Color( 0xff0a485c )
        , 900: Color( 0xff05242e )
        }),
        scaffoldBackgroundColor: const Color(0xff17a2d0)
      ),
    )
  );
}