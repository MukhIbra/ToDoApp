import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  var box = Hive.box('mybox');

  // initializing data
  void createInitialData() {
    toDoList = [
      ['Make Exercise', false],
      ['Finish Homework', false]
    ];
  }

// GET DATA
  void loadData() {
    toDoList = box.get('TODOLIST');
  }

// update DATA

  void update() {
    box.put('TODOLIST', toDoList);
  }
}
