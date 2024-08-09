import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase__utils.dart';
import 'package:todo/home/task_list/task_list_item.dart';
import 'package:todo/provider/list_provider.dart';

import '../../model/task.dart';

class TaskListTap extends StatefulWidget {
  @override
  State<TaskListTap> createState() => _TaskListTapState();
}

class _TaskListTapState extends State<TaskListTap> {

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);

    if(listProvider.tasksList.isEmpty){
      listProvider.getAllTasksFromFireStore();

    }
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: listProvider.selectDate,
          onDateChange: (selectedDate) {
            listProvider.changeSelectDate(selectedDate);
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context,index)
          {
            return TaskListItem(task: listProvider.tasksList[index],);
          },
          itemCount: listProvider.tasksList.length,
          ),
        )
      ],
    );
  }

}
