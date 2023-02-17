
import 'package:firebase_toshal/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'onboarding_screen.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green.shade900,
    ),
    debugShowCheckedModeBanner: false,
    home: splash(),//login_screen.dart,(MyApp) send_otp.dart , register_page.dart
  ));
}
