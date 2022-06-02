
import 'package:flutter/material.dart';
class figureOne extends StatefulWidget {
  figureOne({Key  key}) : super(key: key);

  @override
  State<figureOne> createState() => _figureOneState();
}

class _figureOneState extends State<figureOne> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

 Center(
   
   child: Column(
    
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              height: 250,
              width: 300,
              decoration: BoxDecoration( 
                color: Color(0xffE9EAEE) ,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/one.png")),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("figureTwo");
              }, 
              child: Text("Get Started"),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20)
              ),)
        ],
      ),
 ));
  }
}