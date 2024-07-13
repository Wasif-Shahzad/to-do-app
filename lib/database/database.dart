import 'package:hive_flutter/hive_flutter.dart';

class ToDoData {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitialData(){
    toDoList = [
      ["Create a new task.", false],
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST"); 
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}