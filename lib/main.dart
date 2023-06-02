import 'package:carwash/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, textTheme: TextTheme(),colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: SplashPage()
    );
  }
}


