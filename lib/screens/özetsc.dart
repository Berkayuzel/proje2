import 'package:flutter/material.dart';
import 'package:proje/dbhelper.dart';
import 'package:proje/dbözet.dart';

class OzetScreen extends StatefulWidget {
  static String id = 'özetsc';

  @override
  State<StatefulWidget> createState() {
    return _OzetScreenState();
  }
}
class _OzetScreenState extends State<OzetScreen> {

  Future<List<Ozet>> ozet;
  TextEditingController controller = TextEditingController();
  bool isUpdating;
  var dbHelper;
  int curMiktar;

  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList(){

    setState(() {
      ozet =  dbHelper.getOzet();
    });

  }

  SingleChildScrollView dataTable(List<Ozet> ozet) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Miktar')),
        ],
        rows: ozet
            .map(
              (ozet) => DataRow(cells: [
            DataCell(Text(ozet.neden), onTap: () {
              setState(() {
                isUpdating = true;
                curMiktar = ozet.miktar;
              });
              controller.text = ozet.neden;
            }),
          ]),
        )
            .toList(),
      ),
    );
  }


  list() {
    return Expanded(
      child: FutureBuilder(
        future: ozet,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }
          if (null == snapshot.data || snapshot.data.lenght == 0) {
            return Text('No data found');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(
          title: new Text('Cüzdan Özeti'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              list()
            ],
          ),
        ),
      );
    }
  }