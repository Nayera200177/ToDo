import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/firebase__utils.dart';
import 'package:todo/provider/list_provider.dart';

import '../../model/task.dart';

class TaskListItem extends StatelessWidget {
  Task task;
  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            extentRatio: 0.25,
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius: BorderRadius.circular(15),
                onPressed: (context){
                  FirebaseUtils.deleteTaskFromFireStore(task.id).timeout(
                    Duration(milliseconds: 500),onTimeout: (){
                      print('Task deleted successfully');
                      listProvider.getAllTasksFromFireStore();
                  }
                  );
                },
                backgroundColor: AppColors.redColor,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                color: AppColors.primayColor,
                width: width*0.01,
                height: height*0.1,
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,
                  style: Theme.of(context)
                    .textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primayColor,
                  fontSize: 22),),
                  Text(task.description ,style: Theme.of(context).textTheme.bodyMedium,)
                ],
              )),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primayColor,

                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.check,size: 35,color: AppColors.whiteColor,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
