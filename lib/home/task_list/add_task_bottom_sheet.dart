import 'package:flutter/material.dart';
import 'package:todo/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          Text('Add new task',
          style: Theme.of(context).textTheme.titleMedium,),
          Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter your task title'
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'enter your task details'
                ),
                maxLines: 4,
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
                  child: Text('31/7/2024',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.check,), label: Text(''),
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
  }
}
