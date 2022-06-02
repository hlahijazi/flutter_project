
import 'package:flutter/material.dart';
import 'package:project_flutter/sqflite.dart';
import 'package:sqflite/sqflite.dart';
class figureTwo extends StatefulWidget {
  figureTwo({Key  key}) : super(key: key);

  @override
  State<figureTwo> createState() => _figureTwoState();
}

class _figureTwoState extends State<figureTwo> {
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
        title: Text("MY Notes"),
        backgroundColor:Theme.of(context).primaryColor,
        centerTitle: true,
         automaticallyImplyLeading: false
      ),
        floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).pushNamed("figureThree");
        },
        child:Container(
          height: 60,
          width: 60,
          child: Icon(Icons.add, size: 40,),
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
         gradient:
                  LinearGradient(colors: [Color(0xff1321E0), Colors.purple])),
    ),),
 
   body: "notes".isEmpty?
              Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 150,
               width: 200,
               decoration: BoxDecoration( 
                color: Color(0xffE9EAEE) ,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/two.png")),
              ),
            ),
            Text("No Notes:(" , style: TextStyle(color: Colors.black54, fontSize: 20),),
            Divider(color: Colors.transparent,),
            Text("You have no task to do.", style: TextStyle(color: Colors.black45, fontSize: 14),),
            
          ],
        ):
   
    Container(
      color: Color(0xffE9EAEE) ,
      child: ListView.builder(
                itemCount: notes.length,
                shrinkWrap: true,
                itemBuilder: (context, i){
                    return Center(
                      child: ListTile(
                        title: Text("${notes[i]['title']}", style: TextStyle(backgroundColor: Colors.white, color:  Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                        subtitle: Text("${notes[i]['note']}",style: TextStyle(backgroundColor: Colors.white,)),
                      ),
                    );
              } 
      ),
    )
    );

  }
}