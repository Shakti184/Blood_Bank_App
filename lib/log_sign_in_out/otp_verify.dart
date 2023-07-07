import 'package:app/log_sign_in_out/sign_up.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
                  height: 27,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Center(
                      child: Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  height: 40,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Enter the OTP sent to +91 9530302222",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  )),
                ),
                const SizedBox(
                  height: 40,
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
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '+91',
                        hintStyle: TextStyle(fontSize: 30, color: Colors.red),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                  // color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Didn't receive an OTP? Resend OTP",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignUpPage())));
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
    );
  }
}
