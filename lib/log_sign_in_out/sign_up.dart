import 'package:app/dashboard.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children:<Widget>[
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 90,
                      child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 45),),
                    ),
                    SizedBox(
                      child: Text("Full Name",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Shati Maddeshiya',
                        hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      child: Text("Date of Birth",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: '23/12/2001',
                        hintStyle: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      child: Text("Age",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: '23',
                        hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      child: Text("Prevailing Health Conditions",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 25),),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'none',
                        hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      child: Text("Blood Group",style: TextStyle(color: Colors.white,fontSize: 25),),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'AB+',
                        hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                    height: 73,
                    width: 270,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, //background color of button
                      elevation: 2, //elevation of button
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(20) //content padding inside button
                    ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: ((context) =>  const HomePage())));},
                      child: const Text("Registor for CheckUp",style: TextStyle(color: Colors.red,fontSize: 20),),
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