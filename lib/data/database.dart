import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];
  final _myBox = Hive.box('mybox');
  void createInitialData(){
    toDoList = [
      ["Demo Task 1",true],
      ["Demo Task 2",false],
    ];
  }
  void loadData(){
    if(_myBox.get('TODOLIST')==null){
      createInitialData();
      return;
    }
    toDoList = _myBox.get('TODOLIST');
  }

  void updateData(){
    _myBox.put('TODOLIST', toDoList);
  }
}