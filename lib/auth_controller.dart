import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_toshal/comman_dailog.dart';
import 'package:firebase_toshal/home.dart';
import 'package:firebase_toshal/splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var userId;

  Future<void> signUp(email, password,username ,mobilenumber,gender, birthdate) async {
    try {
      CommanDialog.showLoading();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,

      );
      print(userCredential);
      CommanDialog.hideLoading();

      try {
        CommanDialog.showLoading();
        var response = await FirebaseFirestore.instance.collection("userslist")
            .add({
          'user_Id' : userCredential.user!.uid,
          'user_name' : username,
          'password' : password,
          'joinDate' : DateTime.now().millisecondsSinceEpoch,
          'email' : email,
          'mobile' : mobilenumber,
          'gender' : gender,
          'Birth_date' : birthdate,
        });
        print("Firebase response1111 ${response.id}");
        CommanDialog.hideLoading();
        Get.back();

      }catch (exception){
        CommanDialog.hideLoading();
        print("Error Saving Data at Firestore $exception");
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();
      if (e.code == 'weak-password') {
        CommanDialog.showErrorDialog(
            description: "The Password Provided is too weak");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommanDialog.showErrorDialog(
            description: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog(description: "Something went wrong!!");
      print(e);
    }
  }

  Future<void> login(email, password) async {

    print('{$email,$password}');

    try {
      CommanDialog.showLoading();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      print(userCredential.user!.uid);
      userId = userCredential.user!.uid;
      CommanDialog.hideLoading();

      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      CommanDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommanDialog.showErrorDialog(
            description: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommanDialog.showErrorDialog(
            description: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }
}