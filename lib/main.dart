


import 'package:flutter/material.dart';
import 'package:violet/FlowerBpage.dart';
import 'package:violet/Homepage.dart';
import 'package:violet/firebase_options.dart';
import 'package:violet/loginpage.dart';
import 'RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_database/firebase_database.dart";


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlowerStoreApp());
}

class Auth{
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream <User?> get authStateChanges => auth.authStateChanges();
  Future <void> signInWithEmailAndPassword(
    {
      required String email,
      required String password

    })async{
      await auth.signInWithEmailAndPassword(email: email,
     password: password);

    }
    Future <void> createUserWithEmailAndPassword(
    {
      required String email,
      required String password

    })async{
      await auth.createUserWithEmailAndPassword(email: email,
     password: password);

    }
    Future <void> signOut(
    )async{
      await auth.signOut();

    }
  
  }



class FlowerStoreApp extends StatelessWidget {
  const FlowerStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( routes: {
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
      },
      title: "flower store (violet )",

    home: Scaffold(body:MyWidget() ,),);
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",
        width: 500,height: 400,),
        const SizedBox(height: 40,),

        const Text("Welcome To Violet",style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,color: Color.fromARGB(255, 100, 90, 136),) ),
        const SizedBox(height: 20,),



        const Row(mainAxisAlignment: MainAxisAlignment.center,children: 
        [Text("Send Your Love Throgh Us ",
        style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,),),Icon(Icons.favorite_sharp,color: Color.fromARGB(255, 100, 90, 136) ,)],)




        ,Container(padding:const EdgeInsets.only(top:50 ),

        child: ElevatedButton
        (child: const Text("Get Started",style: TextStyle(color: Color.fromARGB(255, 100, 90, 136)),),onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return const reg();
              }));}) ),
        ]
        ,);
  }
}

///register

class reg extends StatelessWidget {
  const reg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
    title: Container(child:Row
    (children:
    [const Text("Violet",
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 100, 90, 136)),),
    Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",width:70,)
    ],)), 
         ) ,
         



              body: SingleChildScrollView(child:RegisterPage()));


    

  }
}

///login


class log extends StatefulWidget {
  const log({super.key});

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
    title: Container(child:Row
    (children:
    [const Text("Violet",
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 100, 90, 136)),),
    Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",width:70,)
    ],)) 
             
         ), 
         



              body: SingleChildScrollView(child: Loginpage(),));
  }
}



///home





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
    title: Container(child:Row
    (children:
    [const Text("Violet",
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 100, 90, 136)),),
    Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",width:70,)
    ],)), actions: [IconButton( onPressed: () {  Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return const Profile();
              }
              ))
              ; }, icon: Icon(Icons.person),)],
         ), 
         



             
              body: SingleChildScrollView(child: Homepage(),));
  }
}




///FlowerBpage
class FlowerB extends StatefulWidget {
  const FlowerB({super.key});

  @override
  State<FlowerB> createState() => _FlowerBState();
}

class _FlowerBState extends State<FlowerB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
    title: Container(child:Row
    (children:
    [const Text("Violet",
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 100, 90, 136)),),
    Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",width:70,)
    ],)), 
         ), 
         



             
              body: const SingleChildScrollView(child: FlowerBpage(),));
  }
}




class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final firebaseService fbs= firebaseService();
  UserDetaills? usr;
  @override
  void initState(){
    super.initState();
    if (Auth().auth.currentUser !=null){
      print("here .....${Auth().auth.currentUser}");
      fatchUserData();
    }
  }
  Future <void> fatchUserData() async {
    try{
      UserDetaills? us= await fbs.getUserFromDatabase();
      if(us !=null){
        setState(() {
          usr=us ; 
        });
      }else {
        print(" user not found");
      }
    }catch (e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    if (usr !=null){ return Scaffold(appBar: AppBar( 
    title: Container(child:Row
    (children:
    [const Text("Violet",
    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 100, 90, 136)),),
    Image.network("https://images.squarespace-cdn.com/content/v1/54a0d58ce4b0bc51a1218662/1672266234571-6G1QJEUMVKJHLXN78QET/Violet.jpg?format=1000w",width:70,)
    ],)), 
         ), 
         


              body: SingleChildScrollView(padding: const EdgeInsets.all(16) ,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ CircleAvatar(radius: 75,
              backgroundImage: NetworkImage(usr!.profilephoto),)
              ,const SizedBox(height: 20,),
              
              TextField(
              
              cursorColor: Colors.white,
              style: const TextStyle(
               color: Colors.white,
              ),
                decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white,),
                hintText: "${usr!.email}",
                filled: true,
                fillColor: Color.fromARGB(255, 188, 158, 222),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),SizedBox(height: 6,),
            TextField(
              
              cursorColor: Colors.white,
              style: const TextStyle(
               color: Colors.white,
              ),
                decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white,),
                hintText: "${usr!.fullName}",
                filled: true,
                fillColor: Color.fromARGB(255, 188, 158, 222),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),SizedBox(height: 6,),TextField(
              
              cursorColor: Colors.white,
              style: const TextStyle(
               color: Colors.white,
              ),
                decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white,),
                hintText: "${usr!.mobileNO}",
                filled: true,
                fillColor: Color.fromARGB(255, 188, 158, 222),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),SizedBox(height: 6,),
              
              ElevatedButton(onPressed: (){Auth().auth.signOut();
              Navigator.pushNamed(context, "/home");}, child: Text("Sign Out"))]
              ,),)
              );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
  }
  
  
}



