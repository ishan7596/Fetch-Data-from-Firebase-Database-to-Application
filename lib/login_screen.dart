import 'package:firebase_toshal/auth_controller.dart';
import 'package:firebase_toshal/home.dart';
import 'package:firebase_toshal/sign_up_screen.dart';
import 'package:firebase_toshal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> userLoginData = {"email": "", "password": ""};
  AuthController controller = Get.put(AuthController());

  bool passwordVisiblee = false;
  login() async{
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('Data for login $userLoginData');
      controller.login(userLoginData["email"],userLoginData["password"]);

    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      body: Card(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                image: AssetImage("assets/plant.jpg")),
          ),
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 20,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(labelText: "Email",labelStyle: GoogleFonts.montserrat(
                      color: Colors.green.shade900,
                      fontSize: 17,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w800),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-Mail Required!!';
                    } else if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value) ==
                        false) {
                      return 'Please enter Valid E-mail!!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    userLoginData['email'] = value!;
                  },
                ),
                TextFormField(

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Required!!';
                    } else if (value.length < 8) {
                      return 'Please Enter Minimum 8 character!!';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: !passwordVisiblee,
                  style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 20,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: GoogleFonts.montserrat(
                        color: Colors.green.shade900,
                        fontSize: 17,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w800),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisiblee
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                      ),

                      onPressed: () {
                        setState(() {
                          passwordVisiblee = !passwordVisiblee;
                        });
                      },
                    ),
                  ),
                  onSaved: (value) {
                    userLoginData['password'] = value!;
                  },
                ),


                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text(
                    "LOGIN NOW",
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: (width <= 550) ? 13 : 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: (width <= 550)
                        ? const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20)
                        : EdgeInsets.symmetric(
                        horizontal: width * 0.2, vertical: 25),
                    textStyle:
                    TextStyle(fontSize: (width <= 550) ? 15 : 15),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: login,
                //   child: Text('Login Now'),
                // ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Text(
                      "Don't Have an Account ? Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
