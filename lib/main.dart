import 'package:flutter/material.dart';
import 'package:proje/screens/özetsc.dart';
import 'package:proje/screens/eklemesc.dart';
import 'package:proje/screens/harcamasc.dart';
import 'Screens/welcomesc.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) =>WelcomeScreen(),
        HarcamaScreen.id: (context)=> HarcamaScreen(),
        EklemeScreen.id:(context)=> EklemeScreen(),
        OzetScreen.id:(context)=> OzetScreen(),



      },
    );
  }
}
