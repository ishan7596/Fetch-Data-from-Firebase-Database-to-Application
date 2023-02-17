import 'package:firebase_toshal/data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'AppDrawer.dart';

// On boarding screen + registration page data store in database + show the user,s data

class Home extends StatefulWidget {
  // final DataController controller = Get.find();
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Home> with SingleTickerProviderStateMixin {
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // drawer: AppDrawer(),
      // appBar: AppBar(centerTitle: true,title: Text("Home Page"),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))]),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                image: AssetImage("assets/plant.jpg")),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lottie.asset("assets/79952-successful.json"),

                Text(
                  'User : ${controller.userProfileData['userName']}',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Gender : ${controller.userProfileData['gender']}',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                // Text(
                //   'BirthDay : ${controller.userProfileData['birthday'] as }',
                //   style: GoogleFonts.montserrat(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 25,
                //   ),
                // ),
                Text(
                  'Mobile : ${controller.userProfileData['mobile']}',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'E-Mail : ${controller.userProfileData['email']}',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Join Date :${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(controller.userProfileData['joinDate']))} ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
