import 'package:firebase_toshal/auth_controller.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataController extends GetxController{

  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileData = {'userName': '', 'joinDate': '', 'mobile' : '','email': '','gender': '','birthday': ''};

  AuthController authController =AuthController();
  void onReady() {
    super.onReady();

    getUserProfileData();
  }
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {
      var response = await firebaseInstance
          .collection('userslist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();
      response.docs.forEach((result) {
        print(result.data());
      });
      if (response.docs.length > 0) {
        userProfileData['userName'] = response.docs[0]['user_name'];
        userProfileData['joinDate'] = response.docs[0]['joinDate'];
        userProfileData['mobile'] = response.docs[0]['mobile'];
        userProfileData['email'] = response.docs[0]['email'];
        userProfileData['gender'] = response.docs[0]['gender'];
        userProfileData['birthday'] = response.docs[0]['birthday'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

}