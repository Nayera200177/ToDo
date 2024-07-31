import 'package:flutter/material.dart';
import 'package:todo/home/home_screen.dart';
import 'package:todo/my_theme_data.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      theme: MyThemeData.LightTheme,
    );
  }
}
