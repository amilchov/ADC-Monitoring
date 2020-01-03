import 'package:adc_monitoring/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Widgets {
  static Widget categoriesListTile(String text) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(FontAwesomeIcons.solidChartBar,
                  color: Custom.hexToColor('#808080')),
            ),
            title: Text(
              text,
              style: TextStyle(
                  color: Custom.hexToColor('#808080'),
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Custom.hexToColor('#808080'), size: 30.0)),
      ),
    );
  }

  static Widget cardText(BuildContext context, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Custom.hexToColor('#808080')),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Custom.hexToColor('#808080')),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  static Widget cardImagesAtlasCern(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/atlas_logo.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/cern_logo.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                flex: 2,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  static Widget cardQrResults(BuildContext context, String title,
      String subtitle, String secondTitle, String secondSubtitle) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Custom.hexToColor('#808080')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 30, right: 30),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Custom.hexToColor('#808080')),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          secondTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Custom.hexToColor('#808080')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 30, right: 30),
                        child: Text(
                          secondSubtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Custom.hexToColor('#808080')),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              flex: 2,
            ),
          ]),
        ],
      ),
    );
  }
}
