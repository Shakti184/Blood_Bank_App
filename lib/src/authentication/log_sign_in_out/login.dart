import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/src/authentication/log_sign_in_out/otp_verify.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  static String verify="";
  static String mobileNum="";
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var phone="";
  TextEditingController countryCode=TextEditingController();
  TextEditingController mobileNumber=TextEditingController(); 

  @override
  void initState() {
    countryCode.text="+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 40,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Enter Your Mobile Number ",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.black,
                          width: 0.8,
                          style: BorderStyle.solid),
                    ),
                    child: TextField(
                      controller: mobileNumber,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                          hintText: "+91",
                          hintStyle: TextStyle(color: Colors.red, fontSize: 30),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 73,
              width: 270,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.redAccent, //background color of button
                    elevation: 2, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.all(20) //content padding inside button
                    ),
                    
                onPressed: () async {
                  LogInPage.mobileNum=mobileNumber.text;
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: (countryCode.text+mobileNumber.text).toString(),
                    
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      LogInPage.verify=verificationId;
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>OtpVerification(verificationId))));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    
                  );
                  
                },
                child: const Text(
                  "Get OTP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
