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

  List<bool> isInitialTaskDone = [
    false, // monday
    false, // tuesday
    false, // wednesday
    false, // thursday
    false, // friday
    false, // saturday
    false, // sunday
  ];

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

  void createInitiatDataCompletion(){
    isInitialTaskDone = [
      false, // monday
      false, // tuesday
      false, // wednesday
      false, // thursday
      false, // friday
      false, // saturday
      false, // sunday
    ];
  }

  void loadData(){
    var loadedData = _myBox.get("TODOLIST");
    var loadedInitialTaskCompletion = _myBox.get("INITIALTASKCOMPLETION");
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
    if(loadedInitialTaskCompletion != null && loadedInitialTaskCompletion is List){
      isInitialTaskDone = List<bool>.from(loadedInitialTaskCompletion);
    }
    else{
      createInitiatDataCompletion();
    }
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
    _myBox.put("INITIALTASKCOMPLETION", isInitialTaskDone);
  }
}