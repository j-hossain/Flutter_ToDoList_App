import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController newTaskControler;
  VoidCallback onAdd;
  VoidCallback onCancle;
  DialogBox({
    super.key,
    required this.newTaskControler,
    required this.onAdd,
    required this.onCancle,
    });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: newTaskControler,
              decoration: InputDecoration(
                labelText: "Task Name",
                focusedBorder:OutlineInputBorder(),
                border:OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  textColor: Theme.of(context).primaryColorLight,
                  onPressed: onAdd,
                  child: Text("Add"),
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColorLight,
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: onCancle,
                  child: Text("Cancle"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}