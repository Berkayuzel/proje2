import 'package:proje/constant.dart';
import 'package:proje/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:proje/screens/özetsc.dart';
import 'package:proje/screens/eklemesc.dart';
import 'package:proje/screens/harcamasc.dart';
import 'package:proje/calculate.dart';

import '../dbhelper.dart';
import '../dbözet.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  Future<Ozet> miktar;
  var dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    getMiktar();


  }

  getMiktar(){
    setState(() {
      miktar=dbHelper.getMiktar();
    });
  }


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
                    child: Image.asset('images/resim.jpg'),
                    height: 100.0,
                  ),
                ),
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: kBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: ListView(
                            children: <Widget>[
                              Text('Cüzdan App',
                                textAlign: TextAlign.left,
                                style: kSendButtonTextStyle,
                              ),
                              Text('Şuan Paranız: ${miktar!=null ? miktar.then((miktar)=>miktar.miktar) : "Hesaplanıyor"}',
                                  textAlign: TextAlign.center,
                                  style: kTextStyle),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 88.0,
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
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, OzetScreen.id),
              title: 'Hesap Özeti',
            ),
          ],
        ),
      ),
    );
  }
}
