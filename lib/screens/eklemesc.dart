import 'package:flutter/material.dart';
import 'package:proje/dbhelper.dart';
import 'package:proje/dbözet.dart';
import 'dart:async';

class EklemeScreen extends StatefulWidget {
  static String id = 'eklemesc';
  final String title;
  EklemeScreen({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _EklemeScreenState();
  }
}

class _EklemeScreenState extends State<EklemeScreen> {
  Future<List<Ozet>> ozet;
  TextEditingController controller = TextEditingController();
  String neden;
  int curMiktar;
  int id;
  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;
  @override
  void initState() {
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      ozet = dbHelper.getOzet();
    });
  }

  clearName() {
    controller.text = '';
  }

  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Ozet o = Ozet(curMiktar, neden, id);
        dbHelper.update(o);
        setState(() {
          isUpdating = false;
        });
      } else {
        Ozet o = Ozet(null, neden, id);
        dbHelper.save(o);
      }
      clearName();
      refreshList();
    }
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Miktar'),
              validator: (val) => val.length == 0 ? 'Miktar Gir' : null,
              onSaved: (val) => neden = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? 'Update' : 'Ekle'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text('Sil'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Para Ekleme'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
          ],
        ),
      ),
    );
  }
}
