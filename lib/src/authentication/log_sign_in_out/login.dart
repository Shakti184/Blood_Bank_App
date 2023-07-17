import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/src/authentication/log_sign_in_out/otp_verify.dart';

class LogInPage extends StatefulWidget {
  const LogInPage( {super.key});
  static String verify = "";
  // static  logIn=logIn;
  static String mobileNum = "";
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var phone = "";
  TextEditingController countryCode = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoding = false;

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          "Enter Your Mobile Number ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.black,
                                width: 0.8,
                                style: BorderStyle.solid),
                          ),
                          child: Form(
                            key: formkey,
                            child: TextFormField(
                                controller: mobileNumber,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                    hintText: "+91",
                                    hintStyle: TextStyle(
                                        color: Colors.red, fontSize: 30),
                                    border: InputBorder.none),
                                validator: (val) {
                                  if (val!.length != 10) {
                                    return "   Mobile Number must be 10 digits";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.redAccent, 
                          elevation: 8, 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(20), 
                          ),
                      onPressed: () {
                        LogInPage.mobileNum = mobileNumber.text;
                        logIn();
                      },
                      child: const Center(
                        child: Text(
                          "Get OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  logIn() async {
    if (formkey.currentState!.validate()) {
      setState(() {
        isLoding = true;
      });
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: (countryCode.text + mobileNumber.text).toString(),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 8,
                backgroundColor: Colors.red,
                title: const Text('Error',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                content: Text(e.message!,
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const LogInPage())));
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          LogInPage.verify = verificationId;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) =>  OtpVerification(verificationId))));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      showSnackbar(context, Colors.red);
      setState(() {
        isLoding = false;
      });
    }
  }
}

void showSnackbar(context, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Number must be at least 10 characters",
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
