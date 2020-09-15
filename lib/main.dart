import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/home_screen.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotlight',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
