import 'package:proje/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:proje/screens/%C3%B6zetsc.dart';
import 'package:proje/screens/eklemesc.dart';
import 'package:proje/screens/harcamasc.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/cüzdan.jpg'),
                    height: 60.0,
                  ),
                ),
                Text(
                  ' Giriş',
                ),
              ],
            ),

            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.green,
              onPressed: () => Navigator.pushNamed(context, EklemeScreen.id),
              title: 'Para Ekleme',
            ),
            RoundedButton(
              color: Colors.red,
              onPressed: () => Navigator.pushNamed(context, HarcamaScreen.id),
              title: 'Harcama Yap',
            ),
            RoundedButton(
              color: Colors.yellow,
              onPressed: () => Navigator.pushNamed(context, OzetScreen.id),
              title: 'Hesap Özeti',
            ),
          ],
        ),
      ),
    );
  }
}
