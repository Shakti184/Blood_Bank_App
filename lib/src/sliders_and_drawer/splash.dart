import 'package:flutter/material.dart';
import 'intro_slider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  String image="assets/images/logoWB.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image,height: 150,width: 150,),
            const SizedBox(height: 10,),
            const Text(" Blood Bank App ",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 4500), () {});
    Navigator.pushReplacement(
      (context),
      MaterialPageRoute(
        builder: ((context) => const IntroSlider()),
      ),
    );
  }
}
