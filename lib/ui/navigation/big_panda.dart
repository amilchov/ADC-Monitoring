import 'package:adc_monitoring/custom.dart';
import 'package:adc_monitoring/screens/big_panda/big_panda_categories.dart';
import 'package:adc_monitoring/service/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigPanda extends StatefulWidget {
  BigPanda({Key key}) : super(key: key);

  @override
  _BigPandaState createState() => _BigPandaState();
}

class _BigPandaState extends State<BigPanda> {
  void onTapCard() {
    Navigation.primitiveNavigation(context, BigPandaCategories());
  }

  final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(FontAwesomeIcons.solidChartBar,
            color: Custom.hexToColor('#808080')),
      ),
      title: Text(
        "Normal (grid+cloud+hpc)",
        style: TextStyle(
            color: Custom.hexToColor('#808080'), fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Custom.hexToColor('#808080'), size: 30.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => onTapCard(),
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(),
            child: makeListTile,
          ),
        ),
      ),
    );
  }
}
