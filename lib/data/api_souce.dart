import 'package:dio/dio.dart';

import '../model/taskModel.dart';

class ToDoAPi{
  List<ToDoTask> toDoList = [];
  String baseURL = "https://api.todoist.com/rest/v2";
  String token = "Bearer ef10b3d99c27e4e662de2a0da86a515d042726a7";
  final Dio dio = Dio();
  Future<bool> loadData() async{
    try {
      final response = await dio.get(baseURL+"/tasks",options: Options(headers: {'Authorization':token}));
      List taskList = response.data;
      taskList.forEach((element) {toDoList.add(ToDoTask.fromJson(element));});
      toDoList.forEach((element) {print('${element.id} ${element.name} ${element.state}');});
      return response.statusCode == 200; // Check if the login was successful
    } catch (e) {
      // Handle error
      print(e);
      return false;
    }
  }

  Future<bool> TaskComplete(index) async{
    try {
      print("Hello");
      final response = await dio.post(
        "$baseURL/tasks/${toDoList[index].id}/close",
        options: Options(headers: {'Authorization':token}));
      if(response.statusCode==200){
        toDoList[index].state^=true;
        return true;
      }
      return false;
    } catch (e) {
      // Handle error
      print(e);
      return false;
    }
  }
}