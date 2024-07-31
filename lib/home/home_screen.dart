import 'package:flutter/material.dart';
import 'package:todo/app_colors.dart';
import 'package:todo/home/settings/settings_tap.dart';
import 'package:todo/home/task_list/add_task_bottom_sheet.dart';
import 'package:todo/home/task_list/task_list_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screem';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.2,
        title: Text('To Do List',
        style: Theme.of(context).textTheme.titleLarge,),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'task list'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTaskBottomShettt();
        },
        child: Icon(Icons.add,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs =[TaskListTap(),SettingsTap()];

  void showAddTaskBottomShettt() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }

}
