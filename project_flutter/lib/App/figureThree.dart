
import 'package:flutter/material.dart';
import 'package:project_flutter/sqflite.dart';
import '../models/task.dart';
import 'package:sqflite/sqflite.dart';
class figureThree extends StatefulWidget {
  figureThree({Key  key}) : super(key: key);

  @override
  State<figureThree> createState() => _figureThreeState();
}

class _figureThreeState extends State<figureThree> {
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
 GlobalKey<FormState> formstate = GlobalKey();
 TextEditingController note = TextEditingController();
 TextEditingController title = TextEditingController();
 TextEditingController color = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
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
                          //   int response = await sqlDb.deletData(
                          //     "DELETE FROM notes WHERE id = ${notes[i]['id']}"
                          //   );
                          //   if (response > 0 ){
                          //     notes.removeWhere((element) => element['id'] == notes[i]['id']);
                          //   }
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
   ],
                    ),
                  ),
                );
             });
          }),
          IconButton(onPressed: () async{
           int response =  await sqlDb.insertData(
              '''
           INSERT INTO notes(`title`, `note`)
           VALUES ("${title.text}", "${note.text}")
           ''');
           if (response > 0 ){
             Navigator.of(context).pushNamed("figureTwo");
           }
          }, icon: Icon(Icons.done)),
          ]),
          body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Form(
            key: formstate,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("13 PM, 12 May",style: TextStyle(color: Colors.black26, fontSize: 12),),
            Divider(color: Colors.transparent,),
            TextFormField(
              controller: title,
              decoration: InputDecoration(
               hintText: "Type Something...",
               hintStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18),
               enabledBorder: UnderlineInputBorder(
               borderSide: BorderSide(
                color: Color(0xffE9EAEE),
                width: 0))
              ),
            ),
            Divider(color: Colors.transparent,),
            TextFormField(
              controller: note,
              decoration: InputDecoration(
               hintText: "Type Something...",
               hintStyle: TextStyle(color: Color(0xffAFCBFA ),fontSize: 18),
               
                border: InputBorder.none,
              ),
            )
                  ]),
          ),
      ),
          );}
          Widget colorBox(Color color, bool selected){
             return Container(     
                 margin: EdgeInsets.all(8),
                       child: selected? Icon(Icons.done): Text(" "),       
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: color,
                              ),
                            );
          }}