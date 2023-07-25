import 'package:app/dashboard.dart';
import 'package:app/src/authentication/log_sign_in_out/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String username = "";
  static String bloodtype = "A+";
  static bool isadult = false;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController donerAge = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController prevalingHealthCond = TextEditingController();
  var bldTyp = [true, false, false, false, false, false, false, false, false];
  var blood = ["A+", "A-", "B+", "B-", "AB+", "AB-", "A-", "O+", "O-"];

  @override
  void dispose() {
    fullName.dispose();
    bloodGroup.dispose();
    donerAge.dispose();
    dob.dispose();
    prevalingHealthCond.dispose();
    super.dispose();
  }

  Future signUp() async {
    SignUpPage.username = fullName.text.toString();
    int typ = 0;
    for (int i = 0; i < 9; i++) {
      if (bldTyp[i] == true) typ = i;
    }
    SignUpPage.bloodtype = blood[typ];
    var aged = int.tryParse(donerAge.text);
    if (SignUpPage.username.isEmpty || aged == null) {
      showSnackbar(context, Colors.white);
    } else {
      SignUpPage.isadult = aged >= 18 ? true : false;
      registorUser();
    }
  }

  Future storeUserDetails(String fullName, String bloodGroup, String age,
      String dob, String phc) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .add({
          'fullName': fullName,
          'dob': dob,
          'bloodGroup': bloodGroup,
          'mobileNum': LogInPage.mobileNum,
          'age': age,
          'PrevalingHealthConditions': phc,
        })
        .whenComplete(
          () => Get.snackbar("Success", "Your details has been registerd.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
          Get.snackbar(
            "Error",
            "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 80,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(
                  child: Text(
                    "Full Name",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Phone Number';
                    } else {
                      return null;
                    }
                  },
                  controller: fullName,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    "Date of Birth",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                TextField(
                  controller: dob,
                  keyboardType: TextInputType.datetime,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter DOB',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    "Age",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                TextField(
                  controller: donerAge,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Age',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    "Prevailing Health Conditions",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 25),
                  ),
                ),
                TextField(
                  controller: prevalingHealthCond,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    hintText: 'none',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    "Blood Group",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[0] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[0] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "A+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[0] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[1] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[1] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "A-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[1] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[2] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[2] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "B+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[2] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[3] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[3] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "B-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[3] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[4] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[4] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "AB+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[4] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[5] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[5] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "AB-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[5] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[6] = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: bldTyp[6] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "A-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[6] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[7] = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: bldTyp[7] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "O+",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[7] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < 9; i++) {
                                bldTyp[i] = false;
                              }
                              bldTyp[8] = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: bldTyp[8] ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "O-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: bldTyp[8] ? Colors.white : Colors.black,
                              ),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: SizedBox(
                    height: 73,
                    width: 270,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.white, //background color of button
                          elevation: 2, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(
                              20) //content padding inside button
                          ),
                      onPressed: () {
                        signUp();
                      },
                      child: const Text(
                        "Registor for CheckUp",
                        style: TextStyle(color: Colors.red, fontSize: 20),
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

  Future<void> registorUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20,
          backgroundColor: Colors.redAccent,
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your details will be saved.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                storeUserDetails(
                  fullName.text.trim(),
                  SignUpPage.bloodtype,
                  donerAge.text.trim(),
                  dob.text.trim(),
                  prevalingHealthCond.text.trim(),
                );
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomePage())),(route)=>false);
              },
            ),
          ],
        );
      },
    );
  }
}

void showSnackbar(context, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Enter Correct Name and Age",
        style: TextStyle(fontSize: 14,color: Colors.red),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.red,
      ),
    ),
  );
}
