import 'package:demo_to_do_app/data/api_souce.dart';
import 'package:demo_to_do_app/data/database.dart';
import 'package:demo_to_do_app/utils/dialog_box.dart';
import 'package:demo_to_do_app/utils/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
    
  }
  
}

class _HomePageState extends State<HomePage>{
  TextEditingController newTaskControler = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  ToDoAPi api = ToDoAPi();

  @override
  void initState() {
    api.loadData();
    db.loadData();
    super.initState();
  }

  void changeTaskState(int index)async{
    if(await api.TaskComplete(index)==true){
      setState((){});
    }
    
    // db.updateData();
  }
  void addNewTask(){
    setState(() {
      String newTaskName = newTaskControler.value.text; 
      if(!newTaskName.isEmpty) db.toDoList.add([newTaskName,false]);
      newTaskControler.clear();
    });
    db.updateData();
    Navigator.pop(context);
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text("TO DO"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: api.toDoList.length,
        itemBuilder: (context,index){
          return TodoTile(
            taskName: api.toDoList[index].name,
            taskState: api.toDoList[index].state,
            onChanged: (value)=> changeTaskState(index),
            onDelete: (context){deleteTask(index);},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Icon(Icons.add,
          color: Theme.of(context).primaryColorLight,
          size: 32,
        ),
        onPressed: (){
          showDialog(context: context, builder: (context){
            return DialogBox(
              newTaskControler: newTaskControler,
              onAdd: addNewTask,
              onCancle: (){Navigator.pop(context);},
            );
          });
        },
      ),
    );
  }
  
}