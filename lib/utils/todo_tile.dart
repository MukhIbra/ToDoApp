import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  String name;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  ToDoTile(
      {super.key,
      required this.name,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              name,
              style: TextStyle(
                  decoration: (taskCompleted)
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontStyle:
                      (taskCompleted) ? FontStyle.italic : FontStyle.normal),
            )
          ]),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
