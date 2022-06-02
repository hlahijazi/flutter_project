
import 'package:flutter/material.dart';
import 'package:project_flutter/sqflite.dart';
class figureFour extends StatefulWidget {
  figureFour({Key  key}) : super(key: key);

  @override
  State<figureFour> createState() => _figureFourState();
}

class _figureFourState extends State<figureFour> {
   List<Color> colorChange = [
   Color(0xfff9fcff),
   Color(0xffffd800),
   Color(0xfff28b81),
   Color(0xfffbf476),
   Color(0xff96b2aa),
   Color(0xffb6b2f0),
   Color(0xfff7eb2e4),
   Color(0xfff95a9ec),
 ];
SqlDb sqlDb = SqlDb();
Future<List<Map>> readData() async{
   List<Map> response = await sqlDb.readData("SELECT * FROM notes");
   return response;
 }
 Future<List<Map>> deletData() async{
   List<Map> response = await sqlDb.deletData("DELETE * FROM notes");
   return response;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                color: Theme.of(context).primaryColor,
                child: Container(
                  child: Column(
                    children: [
                    Row(
                       children: [
                        MaterialButton(
                          child: CircleAvatar(
                            backgroundColor: Color(0xffb6b3f0),
                            child: Icon(Icons.share, color: Colors.black),
                          ),
                        ),
                        Text("Share with your friends", style: TextStyle(color: Color(0xffdddef9), fontSize: 20),),
                      ],),
                      Divider(color: Colors.transparent,),
                      Row(
                      children: [
                        MaterialButton(
                          child: CircleAvatar(
                            backgroundColor: Color(0xffb6b3f0),
                            child: Icon(Icons.delete, color: Colors.black,),
                          ),
                          // onPressed: ()async{
                          //     int response = await sqlDb.deletData("DELETE FROM notes WHERE id = ${snapshot.data[i]['note']}");
                          // } ,
                        ),
                        Text("Delete", style: TextStyle(color: Color(0xffdddef9), fontSize: 20),),
                      ],),
                      Divider(color: Colors.transparent,),
                      Row(
                      children: [
                        MaterialButton(
                          child: CircleAvatar(
                            backgroundColor: Color(0xffb6b3f0),
                            child: Icon(Icons.copy, color: Colors.black),
                          ),
                        ),
                        Text("Duplicate",style: TextStyle(color: Color(0xffdddef9), fontSize: 20),),
                      ],),
                      Divider(color: Colors.transparent,),   
                    SizedBox(
                              height: 50,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                         
                          children: colorChange
                                          .map((e) => GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    colorChange = e as List<Color>;
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 35,
                                                  margin: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color:e ,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: colorChange == e
                                                      ? Center(
                                                          child: Icon(
                                                          Icons.check,
                                                          size: 25,
                                                        ))
                                                      : Container(),
                                                ),
                                              ))
                                          .toList(),
                        ),
                      
                 ),
                      
                  ],),
                ),
              );
            });
          }, icon: Icon(Icons.more_vert)),
          IconButton(onPressed: (){}, icon: Icon(Icons.done)),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
        ]),),

    );
  }
}