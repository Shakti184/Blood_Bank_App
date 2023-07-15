import 'package:app/dashboard.dart';
import 'package:app/src/authentication/log_sign_in_out/login.dart';
import 'package:app/src/authentication/models/user_model.dart';
import 'package:app/src/authentication/models/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String username="";

  @override
  State<SignUpPage> createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullName=TextEditingController();
  TextEditingController bloodGroup=TextEditingController();
  TextEditingController donerAge=TextEditingController();

  @override
  void dispose(){
    fullName.dispose();
    bloodGroup.dispose();
    donerAge.dispose();
    super.dispose();
  }

  Future signUp()async{
    SignUpPage.username=fullName.text.toString();
    storeUserDetails(
      fullName.text.trim(), 
      bloodGroup.text.trim(),
      donerAge.text.trim(),
    );

  }

  Future storeUserDetails(String fullName,String bloodGroup,String age)async{
    await FirebaseFirestore.instance.collection('Users').add({
      'fullName': fullName,
      'bloodGroup': bloodGroup,
      'mobileNum': LogInPage.mobileNum,
      'age':age,
    }).whenComplete(
      () => Get.snackbar("Success", "Your account has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:Colors.green.withOpacity(0.1),
      colorText:Colors.green),
     )
     .catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red,
      );
      // print(error.toString());
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
                children:[
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 90,
                        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 45),),
                      ),
                      const SizedBox(
                        child: Text("Full Name",style: TextStyle(color: Colors.white,fontSize: 25),),
                      ),
                      TextField(
                        controller: fullName,
                        style: const TextStyle(color: Colors.white,fontSize: 22),
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'Your Name',
                          hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        child: Text("Date of Birth",style: TextStyle(color: Colors.white,fontSize: 25),),
                      ),
                      const TextField(
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(color: Colors.white,fontSize: 22),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: '23/12/2001',
                          hintStyle: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        child: Text("Age",style: TextStyle(color: Colors.white,fontSize: 25),),
                      ),
                      TextField(
                        controller: donerAge,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white,fontSize: 22),
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: '__',
                          hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        child: Text("Prevailing Health Conditions",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 25),),
                      ),
                      const TextField(
                        
                        style: TextStyle(color: Colors.white,fontSize: 22),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'none',
                          hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        child: Text("Blood Group",style: TextStyle(color: Colors.white,fontSize: 25),),
                      ),
                       TextField(
                        controller: bloodGroup,
                        style: const TextStyle(color: Colors.white,fontSize: 22),
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'AB+',
                          hintStyle: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.w300),
                        ),
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
                          backgroundColor: Colors.white, //background color of button
                          elevation: 2, //elevation of button
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.all(20) //content padding inside button
                        ),
                          onPressed: (){
                            signUp();
                            Navigator.push(context, MaterialPageRoute(builder: ((context) =>  const HomePage())));
                            },
                          child: const Text("Registor for CheckUp",style: TextStyle(color: Colors.red,fontSize: 20),),
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






    
final userRepo=Get.put(UserRepository());

Future<void> createUser(UserModel user)async{
  await userRepo.createUser(user);
}

}
