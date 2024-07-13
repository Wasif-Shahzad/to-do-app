import 'package:hive_flutter/hive_flutter.dart';

class ToDoData {
  final _myBox = Hive.box('myBox');

  Map<String, List> toDoList = {
    "monday": [],
    "tuesday": [],
    "wednesday": [],
    "thursday": [],
    "friday": [],
    "saturday": [],
    "sunday": [],
  };

  void createInitialData(){
    toDoList = {
      "monday": [["Create a new task.", false]],
      "tuesday": [["Create a new task.", false]],
      "wednesday": [["Create a new task.", false]],
      "thursday": [["Create a new task.", false]],
      "friday": [["Create a new task.", false]],
      "saturday": [["Create a new task.", false]],
      "sunday": [["Create a new task.", false]],
    };
  }

  void loadData(){
    var loadedData = _myBox.get("TODOLIST");
    if(loadedData != null && loadedData is Map){
      toDoList = Map<String, List>.from(
        loadedData.map((key, value) => MapEntry(
          key as String,
          List<dynamic>.from(value).map((e) => e as List).toList(),
        )),
      );
    }
    else {
      createInitialData();
    }
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}