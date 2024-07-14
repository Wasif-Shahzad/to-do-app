import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/util/add_task_dialogue_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class SundayTasks extends StatefulWidget {
  const SundayTasks({super.key});

  @override
  State<SundayTasks> createState() => _SundayTasksState();
}

class _SundayTasksState extends State<SundayTasks> {
  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  ToDoData db = ToDoData();
  final String day = "sunday";
  final int dayIndex = 6;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index){
    setState(() {
      if(db.toDoList[day] != null){
        db.toDoList[day]![index][1] = !db.toDoList[day]![index][1];
      }
    });
    db.updateData();
  }

  void saveNewTask(){
    setState(() {
      if(db.toDoList[day] != null){
        db.toDoList[day]!.add([_controller.text, false]);
      }
      if(db.isInitialTaskDone[dayIndex] == false && db.toDoList[day]!.length == 2 && db.toDoList[day]![0][0] == "Create a new task."){
        db.isInitialTaskDone[dayIndex] = true;
        db.toDoList[day]![0][1] = true;
      }
      _controller.clear();
    });
    // print(db.isInitialTaskDone[dayIndex]);
    Navigator.of(context).pop();
    db.updateData();
  }

  void addNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          }
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      if(db.toDoList[day] != null){
        db.toDoList[day]!.removeAt(index);
      }
      _controller.clear();
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: const Center(child: Text('TO DO FOR SUNDAY')),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Days',
                style: TextStyle(fontSize: 24,),
              )
            ),
            ListTile(
              title: const Text('Monday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/monday');
              },
            ),
            ListTile(
              title: const Text('Tuesday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tuesday');
              },
            ),
            ListTile(
              title: const Text('Wednesday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/wednesday');
              },
            ),
            ListTile(
              title: const Text('Thursday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/thursday');
              },
            ),
            ListTile(
              title: const Text('Friday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/friday');
              },
            ),
            ListTile(
              title: const Text('Saturday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/saturday');
              },
            ),
            ListTile(
              title: const Text('Sunday'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sunday');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList[day]!.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.toDoList[day]![index][0],
            taskStatus: db.toDoList[day]![index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addNewTask();
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }
}