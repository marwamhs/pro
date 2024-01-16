
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:violet/main.dart';

class Loginpage extends StatefulWidget {
  @override
  MyPageState createState() {
    return MyPageState();
  }
}
TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPassword = TextEditingController();


class MyPageState extends State<Loginpage> {
 
  @override
  Widget build(BuildContext context) {
 
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
        children: <Widget>[
           Padding(
             padding: const EdgeInsets.fromLTRB(30, 90, 30, 15),
             child: TextField(
           controller: controllerEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.alternate_email,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("E-mail"),
              ),
                     ),
           ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 30),
            child: TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.password,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("Password"),
                
              ),
            ),
          ),

          

          
           Container(padding:const EdgeInsets.only(top:75,left: 125 ),
           child: ElevatedButton
           (child:   const Text("Login",style: TextStyle(color: Color.fromARGB(255, 100, 90, 136)),),onPressed: (){
            handleSignin();
              Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return const Home();
              }
              ))
              ;
              })
               ),

               



               
          

           

          
        ],
      
    );
  }
   Future<void> handleSignin() async {
    try{
      await Auth().signInWithEmailAndPassword(
        email: controllerEmail.text, 
        password: controllerPassword.text);
        print("Logged in Successfully");
        Navigator.pushNamed(context, "/profile");
    } on FirebaseAuthException catch(e){
      print(e.message);
    }
  }
}

