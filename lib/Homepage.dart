
import 'package:flutter/material.dart';
import 'package:violet/main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
              
    return Column(children: <Widget>[
      SizedBox(height: 20,),

        Container(
          width: double.maxFinite,
          height: 210.0,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(5.0)),
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/15/d0/c3/15d0c3f3bb79429e713c277904b20ad3.jpg'),
            fit: BoxFit.cover,
            ),
          ),



        ),SizedBox(height: 8,),
        
        ElevatedButton(onPressed: (){{
              Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return const FlowerB();
              }
              ))
              ;
              }}, child: const Text("Flower Bouquet",
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 100, 90, 136)),)),



        SizedBox(height: 25,),



         Container(
          width: double.maxFinite,
          height: 210.0,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(5.0)),
            image:  DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/6e/c7/af/6ec7afc5890aeb17b17a31578cd9f0b8.jpg'),
            fit: BoxFit.cover,
            ),
          ),
        ),
        
        
        SizedBox(height: 8,),
        
        
        ElevatedButton(onPressed: (){}
        , child: 
        const Text("Flower Boxes",
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 100, 90, 136)),)),
        
        
      ]);
         
  }
}
