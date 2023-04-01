import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/NavBar.dart';
import 'package:todoapp/utils/todo_tile.dart';

import 'BottomNav.dart';

class HomePg extends StatefulWidget {
  const HomePg({Key? key}) : super(key: key);

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  final TextEditingController _taskController = TextEditingController();
  // List Of To Do Tasks
  List todoList= [
    ["Make a tutorial",false],
    ["Do Exercise", false],
  ];

  void checkBoxChanged(bool? value,int index){
   setState(() {
     todoList[index][1] = !todoList[index][1];
   });
  }

  void SaveNewTask()
  {
    setState(() {
      todoList.add([_taskController.text, false]);
    });
    Navigator.of(context).pop();
  }



  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.lightBlue.shade50,
              content: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  [
                    TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add New Task",),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed:(){
                              SaveNewTask();
                            },
                            child: Text("Save",style: TextStyle(color: Colors.white),),
                           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade900)),
                        ),
                        SizedBox(width: 10,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        )
                      ],
                    )

                ],
                ),
              ),
          );
        });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
    backgroundColor: Colors.lightBlue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          elevation: 20,
          title: Text("Taskify",style: GoogleFonts.abel(fontSize: 30),),
          centerTitle: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            createNewTask();
          },
           child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: ( context, index) {
          return ToDoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value)=> checkBoxChanged(value,index));
        },

      ),
    );
  }
}
