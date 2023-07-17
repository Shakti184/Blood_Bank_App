import 'package:app/src/authentication/log_sign_in_out/login.dart';
import 'package:app/src/authentication/log_sign_in_out/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification(String verificationId, {super.key});
  // const OtpVerification(String verificationId, {super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = "";
  bool isLoding = false;
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  
  var mobileNum = LogInPage.mobileNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
                width: double.infinity,
                // color: Colors.blue,
                child: Center(
                    child: Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
                // color: Colors.blue,
                child: Center(
                    child: Text(
                  "Enter the OTP sent to +91 $mobileNum",
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: PinCodeTextField(
                  keyboardType: TextInputType.phone,
                  pastedTextStyle: const TextStyle(color: Colors.red),
                  length: 6,
                  cursorColor: Colors.red,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: Colors.red,
                    selectedFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: 25,
                width: double.infinity,
                // color: Colors.blue,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    "Didn't receive an OTP? ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LogInPage())));
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 239, 122, 122),
                      backgroundColor:
                          Colors.redAccent, //background color of button
                      elevation: 8, //elevation of button
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20)),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: LogInPage.verify, smsCode: textEditingController.text);
                      await auth.signInWithCredential(credential);
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute( 
                                builder: (context) => const SignUpPage()),
                            (route) => false);
                      }
                    } catch (e) {
                      showSnackbar(context, Colors.red);
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackbar(context, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Enter the Valid OTP",
        style: TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
