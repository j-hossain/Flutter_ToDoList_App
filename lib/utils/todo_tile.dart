import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskState;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskState,
    required this.onChanged,
    required this.onDelete,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion:BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10.0),
              onPressed: onDelete,
              icon: Icons.delete_outline_rounded,
              backgroundColor: Colors.red.shade300,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Checkbox(value: taskState, onChanged: onChanged,
                // activeColor: Theme.of(context).primaryColorLight,
              ),
              Text(taskName,
                style: TextStyle(
                  decoration: taskState?TextDecoration.lineThrough:TextDecoration.none,
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}