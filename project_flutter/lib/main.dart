import 'sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:project_flutter/App/figureOne.dart';
import 'package:project_flutter/App/figureTwo.dart';
import 'package:project_flutter/App/figureThree.dart';
import 'package:project_flutter/App/figureFour.dart';
import 'sqflite.dart';
import 'models/task.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

void main(){
     runApp(MyApp());
 }
 class MyApp extends StatelessWidget{
  SqlDb sqlDb = SqlDb();
   bool isLoading = true;
   List notes = [];
   Future readData() async{
   List<Map> response = await sqlDb.readData("SELECT * FROM notes");
   notes.addAll(response);
   isLoading = false;
   if (this.mounted){
     setState(() { });
   }
   }
  
@override
  void initState() {
    readData();
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       
       theme: ThemeData(
         primaryColor: Color(0xff1321E0),
       ) ,
       home: figureOne(),
       routes: {
       "figureOne": (context) => figureOne(),
       "figureTwo": (contex) => figureTwo(),
       "figureThree": (context) => figureThree(),
       "figureFour": (context) => figureFour(),
      // "AppDrawer":(context) => AppDrawer(),
      },
      debugShowCheckedModeBanner: false,
      
     );
   }
 }
 