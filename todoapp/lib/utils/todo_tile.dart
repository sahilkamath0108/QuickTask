import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
      final String taskName;
    final bool taskCompleted;
   Function(bool?)? onChanged;

   ToDoTile({
     super.key,
     required this.taskName,
     required this.taskCompleted,
     required this.onChanged,

   });

//   @override
//   State<ToDoList> createState() => _ToDoListState();
// }
//
// class _ToDoListState extends State<ToDoList> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.black,),
            Text(
              taskName,
              style: GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 19,
                  decoration:taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
