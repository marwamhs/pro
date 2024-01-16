import 'package:flutter/material.dart';

class FlowerBpage extends StatefulWidget {
  const FlowerBpage({super.key});

  @override
  State<FlowerBpage> createState() => _FlowerBpageState();
}

class _FlowerBpageState extends State<FlowerBpage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
       Container(
          width: double.maxFinite,
          height: 210.0,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(5.0)),
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/15/d0/c3/15d0c3f3bb79429e713c277904b20ad3.jpg',)))),



      
      Card(
        
       clipBehavior: Clip.hardEdge,
        child: InkWell(
          
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('Type ="Roses"                                          ColorsAvailable=""                       ThepriceRange=""'),
          ),
        ),)
        
        
        
        ,
        
        SizedBox(height: 15,),
        
        Container(
          width: double.maxFinite,
          height: 210.0,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(5.0)),
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/44/ac/ff/44acff6727ea0dd71562f3da0bbecc29.jpg')))),



      
      Card(
        
       clipBehavior: Clip.hardEdge,
        child: InkWell(
          
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('Type ="Lilies"                                          ColorsAvailable=""                       ThepriceRange=""'),
          ),
        ),)]
      );
}}
  