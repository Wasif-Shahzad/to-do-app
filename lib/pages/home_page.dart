import 'package:flutter/material.dart';
import 'package:todo_app/util/add_task_dialogue_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List ToDoList = [];

  void checkBoxChanged(bool? value, int index){
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      ToDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void addNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: const Center(child: Text('TO DO')),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: ToDoList[index][0],
            taskStatus: ToDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
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