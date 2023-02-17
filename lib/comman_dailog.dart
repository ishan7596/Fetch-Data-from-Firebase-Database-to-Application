import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommanDialog {

 static showLoading({String title = "Loading..."}) {

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

 static hideLoading() {
    Get.back();
  }

 static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong "}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: GoogleFonts.montserrat(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.montserrat(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textStyle: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }


}
