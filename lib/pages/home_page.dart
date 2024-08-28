import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mytodo/database/database.dart';
import 'package:mytodo/utils/dialog_box.dart';

import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Hive

class _HomePageState extends State<HomePage> {
  var box = Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (box.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  var controller = TextEditingController();

  void onDeleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.update();
  }



  void onCancel() {
    Navigator.pop(context);
    controller.clear();
  }

  void onSave() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    db.update();
    Navigator.of(context).pop();
  }

  void onAddTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onCancel: onCancel,
          onSave: onSave,
        );
      },
    );
  }

  void onCheckBoxPressed(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: onAddTask,
      ),
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Center(child: Text('TO DO')),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            name: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (p0) => onCheckBoxPressed(index),
            deleteFunction: (p0) => onDeleteTask(index),

          );
        },
      ),
    );
  }
}
