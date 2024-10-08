import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/firebase__utils.dart';
import 'package:todo/model/task.dart';
import 'package:todo/provider/list_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectDate = DateTime.now();
  var formkey =GlobalKey<FormState>();
  String title = '';
  String description = '';
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    return  Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text('Add new task',
          style: Theme.of(context).textTheme.titleMedium,),
          Form(
              key: formkey,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (text){
                  title = text;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'please enter task title';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'enter your task title'
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              TextFormField(
                onChanged: (text){
                  description = text;
                },
                validator: (text){
                  if(text == null || text.isEmpty){
                    return 'please enter task details';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'enter your task details'
                ),
                maxLines: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Select time',
                style: Theme.of(context).textTheme.bodyMedium,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    showCalender();
                  },
                  child: Text('${selectDate.day}/${selectDate.month}/'
                    '${selectDate.year}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton.icon(onPressed: (){
                  addTask();
                }, icon: Icon(Icons.check,), label: Text(''),
                  style:
                  ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.fromLTRB(18, 10, 10, 10),
                    backgroundColor: AppColors.primayColor
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  void showCalender() async{
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectDate = chosenDate ?? selectDate;
    setState(() {

    });
  }

  void addTask() {
    if(formkey.currentState?.validate() == true){
      Task task = Task(
          title: title,
          description: description,
          dateTime: selectDate,
           isDone: true
      );
      FirebaseUtils.addTaskToFirebase(task).timeout(Duration(seconds: 1),
      onTimeout: (){
        print('Task added successfully');
        listProvider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }
}
