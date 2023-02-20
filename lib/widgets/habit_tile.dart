import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitTile extends StatelessWidget {
  final String habitName;

  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      this.onChanged,
      this.settingsTapped,
      this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.3),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          //settings option
          SlidableAction(
            onPressed: settingsTapped,
            icon: Icons.edit,
            backgroundColor: Color.fromARGB(255, 65, 59, 59),
            borderRadius: BorderRadius.circular(8),
          ),
        ]),
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          //delete option
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Color.fromARGB(255, 223, 60, 60),
            borderRadius: BorderRadius.circular(8),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: habitCompleted,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 13, 71, 161),
                focusColor: Color.fromARGB(255, 13, 71, 161),
                hoverColor: Color.fromARGB(255, 13, 71, 161),
              ),

              //habit name
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    habitName,
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Comfortaa'),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
