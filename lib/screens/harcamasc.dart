import 'package:proje/constant.dart';
import 'package:flutter/material.dart';


class HarcamaScreen extends StatefulWidget {
  static String id= 'harcamasc';
  @override
  _HarcamaScreenState createState() => _HarcamaScreenState();
}

class _HarcamaScreenState extends State<HarcamaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/cüzdan.jpg'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                },
                decoration:
                kTextFieldDecoration.copyWith(hintText: 'Harcama Miktarı'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  onChanged: (value) {
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Harcama Nedeni'
                  )
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Harca',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
