import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:managment/Screen_Home.dart';

import 'package:managment/functions/model/data_model.dart';


Future <void> main() async {
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
 {
   Hive.registerAdapter(StudentModelAdapter());
 }

  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen()
    );
  }
}
  