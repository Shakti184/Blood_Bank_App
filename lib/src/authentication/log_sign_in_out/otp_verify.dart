import 'package:app/src/authentication/log_sign_in_out/login.dart';
import 'package:app/src/authentication/log_sign_in_out/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
   const OtpVerification(String verificationId,{super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final FirebaseAuth auth = FirebaseAuth.instance; 
   var code="";

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
              const SizedBox(
                height: 20,
                width: double.infinity,
                // color: Colors.blue,
                child: Center(
                    child: Text(
                  "Enter the OTP sent to +91 9530302222",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                )),
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

                  child:  TextField(
                    onChanged: (value){
                      // print(value);
                      code=value;
                    },
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '__  __  __  __',
                      hintStyle: TextStyle(fontSize: 30, color: Colors.red),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
                width: double.infinity,
                // color: Colors.blue,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Didn't receive an OTP? ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "Resend OTP",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                  )
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              // Pinput(
              //   length:6,showCursor:true,onChange:(value){code=value;}
              // ),
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
                      padding: const EdgeInsets.all(
                          20) //content padding inside button
                      ),
                  onPressed: () async {
                    //  print(code);
                    //  print(LogInPage.verify);
                    try{
                      PhoneAuthCredential credential =PhoneAuthProvider.credential(verificationId: LogInPage.verify, smsCode: code);
                      await auth.signInWithCredential(credential);
                      if(context.mounted){
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> const SignUpPage()),(route) => false);
                      }
                    }catch(e){
                      print(e);
                    }
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white, fontSize: 30),
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
