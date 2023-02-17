import 'package:firebase_toshal/data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppDrawer extends StatelessWidget {
  // DataController controller = Get.find();
  final DataController controller = Get.put(DataController());
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   'User : ${controller.userProfileData['userName']}',
            //   style: GoogleFonts.montserrat(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            // Text(
            //   'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
            //   style: GoogleFonts.montserrat(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            // Text(
            //   'Mobile : ${controller.userProfileData['mobile'] }',
            //   style: GoogleFonts.montserrat(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            Text(
              'User : ${controller.userProfileData['userName']}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Gender : ${controller.userProfileData['gender']}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Text(
            //   'BirthDay : ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['birthday']))} }',
            //   style: GoogleFonts.montserrat(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            Text(
              'Mobile : ${controller.userProfileData['mobile']}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'E-Mail : ${controller.userProfileData['email']}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Text(
            //   'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
            //   style: GoogleFonts.montserrat(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
