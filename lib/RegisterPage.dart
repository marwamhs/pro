



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:violet/main.dart';
import "package:firebase_database/firebase_database.dart";
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class RegisterPage extends StatefulWidget {
  @override
  MyPageState createState() {
    return MyPageState();
  }
}
TextEditingController ControllerName = TextEditingController();
TextEditingController controllerPassword = TextEditingController();
TextEditingController ControllerPhone = TextEditingController();
TextEditingController controllerEmail = TextEditingController();





class MyPageState extends State<RegisterPage> {
 
  @override
  Widget build(BuildContext context) {
 
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
           Padding(
             padding: const EdgeInsets.fromLTRB(30, 50, 30, 5),
             child: TextField(
           controller: ControllerName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.person_2_outlined,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("Name"),
              ),
                     ),
           ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
            child: TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.password,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("Password"),
                
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
            child: TextField(
              controller: ControllerPhone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.phone,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("PhoneNumber"),
                
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
            child: TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.alternate_email,color: Color.fromARGB(255, 100, 90, 136)),
                label: Text("E-mail"),
              ),
            ),
          ),
          
           Container(padding:const EdgeInsets.only(top:75, ),
           child: ElevatedButton
           (child:   const Text("Register",style: TextStyle(color: Color.fromARGB(255, 100, 90, 136)),),onPressed: (){
              {
                    // Create a RegistrationData instance with the entered values

                

                    // Now you can use the registrationData object as needed
                    handlSignup();
              Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return const Home();
                
              }));
              }})
               ),

               const SizedBox(height: 40,),



               RichText( text: TextSpan(
                children: [ TextSpan(  text: 'You Alredy Have Account',
               style: const TextStyle(
               color: Color.fromARGB(255, 100, 90, 136),
           decoration: TextDecoration.underline,
          ),
        recognizer: TapGestureRecognizer()..onTap = (){Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return  log();}));})
    ],
  ),
)
              
          

           

          
        ],
      
    );
  }
   final DatabaseReference userRef= FirebaseDatabase.instance.ref().child("Users");
   
  
    void handlSignup()async  {
     
    Auth().createUserWithEmailAndPassword(
    email: controllerEmail.text, 
    password: controllerPassword.text
    ).whenComplete(() {
      print("User Added Success");
      Auth().auth.authStateChanges().first;
      Future.delayed(Duration(seconds: 3)).then((value) {try{
       UserDetaills user=UserDetaills(
        email: controllerEmail.text,
         fullName: ControllerName.text,
          mobileNO: ControllerPhone.text,
          profilephoto:"" );
          if (Auth().auth.currentUser !=null){
            print(Auth().auth.currentUser!.uid);
        userRef.child(Auth().auth.currentUser!.uid).set(user.toMap()).then((value) 
        {print("user added successfully to realtime database");
        Navigator.pushNamed(context, "/profile");
        }).catchError((error){
          print("Failed to add user to realtimedatabase ");
          print(error.toString());
        });
          }
        
        else{ print("the user uid is still null");}
      }on FirebaseException catch(error){print("error occured ...");
      print(error.message);}
    });
    
    
    } );


      
 
}
}
class UserDetaills{
  String fullName;
  String email;
  String mobileNO;
  String profilephoto;
  UserDetaills({required this.email,
  required this.fullName,
  required this.mobileNO,
  required this.profilephoto});
  Map<dynamic,dynamic> toMap(){
    return{
      "fullName":fullName,"email":email,
      "mobileNO":mobileNO,"profilephoto":profilephoto,

    };
  }
  factory UserDetaills.fromMap(Map<dynamic,dynamic> map){
    return UserDetaills(email: map["fullName"], fullName: map["email"], mobileNO: map["mobileNO"], profilephoto: map["profilephoto"]);
  }


}

class firebaseService{
  User? user=Auth().auth.currentUser;
  DatabaseReference userref= FirebaseDatabase.instance.ref().child("Users");
  Future<UserDetaills?> getUserFromDatabase()async{
    try{if (user !=null){
      DatabaseEvent event=await userref.child(user!.uid).once();
      if(event.snapshot.value !=null){
        Map<dynamic,dynamic> snapMap= event.snapshot.value as dynamic;
        return UserDetaills.fromMap(snapMap);
      }
      else {
        print("user details null");
        return null;
      }
      
    }
    else{
      print("the current user is null ");
      return null;
    }}catch (e){
      print(e.toString());
      return null;
    }
  }
}