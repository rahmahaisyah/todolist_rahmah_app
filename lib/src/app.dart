import 'package:flutter_todolist_rahmah_app/main.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class App extends StatelessWidget {
   const App({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HomeScreen(),
     );
   }
 }
 