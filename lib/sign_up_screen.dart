import 'package:firebase_toshal/auth_controller.dart';
import 'package:firebase_toshal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userSignupData = {
    "username": "",
    "email": "",
    "password": "",
    "mobilenumber" : "",
    "gender" : "",
  };
  bool passwordVisiblee = false;
  AuthController controller = Get.find();
  DateTime date = DateTime.now();
  TextEditingController bDate = TextEditingController();

  signUp() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('User Sign Up Data $userSignupData');
      controller.signUp(userSignupData["email"], userSignupData["password"],
          userSignupData["username"],userSignupData["mobilenumber"],userSignupData['gender'],userSignupData['birthdate']);
    }
  }
  List<DropdownMenuItem<String>> _dropDownMenuItems = [
    DropdownMenuItem(
      child: Text("Male",style: GoogleFonts.montserrat(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.bold)),
      value: "Male",
    ),
    DropdownMenuItem(
      child: Text("Female",style: GoogleFonts.montserrat(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.bold)),
      value: "Female",
    ),
    DropdownMenuItem(
      child: Text("Other",style: GoogleFonts.montserrat(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.bold)),
      value: "Other",
    ),
  ];
  String? _selectedGender;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Card(
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
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'User Name Required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['username'] = value!;
                    },
                  ),
                  DropdownButtonFormField(
                    // elevation: 100,
                    dropdownColor: Colors.white70,

                    borderRadius: BorderRadius.circular(30),
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration:  InputDecoration(
                      label: Text(
                        "Gender",

                      ),
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800),
                    ),
                    value: _selectedGender,

                    items: _dropDownMenuItems,
                    onSaved: (value) {
                      userSignupData['gender'] = value!;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value! as String?;
                      });
                    },
                  ),
                  TextFormField(
                    controller: bDate,
                    readOnly: true,
                    onTap: () {
                      _openDatePicker();
                    },
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration:  InputDecoration(
                      labelText: "Birth Date",
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your Birthdate";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['birthdate'] = value!;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: "Mobile No.",
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "Please enter your valid mobile number";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userSignupData['mobilenumber'] = value!;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.montserrat(
                          color: Colors.green.shade900,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800),
                    ),
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
                      userSignupData['email'] = value!;
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
                      userSignupData['password'] = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: signUp,
                    child: Text(
                      "Submit",
                      style: GoogleFonts.montserrat(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: (width <= 550) ? 17 : 17,
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
                      textStyle: TextStyle(fontSize: (width <= 550) ? 15 : 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _openDatePicker() async {
    final DateFormat now = DateFormat('dd/MM/yyyy');
    var d = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    setState(() {
      bDate.text = now.format(d!);
    });
  }
}
