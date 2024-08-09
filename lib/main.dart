import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/home_screen.dart';
import 'package:todo/my_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/provider/list_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MyApp()));

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
