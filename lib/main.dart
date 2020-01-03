import 'dart:io';

import 'package:adc_monitoring/base_text.dart';
import 'package:adc_monitoring/screens/qr_scanner.dart';
import 'package:adc_monitoring/service/navigation.dart';
import 'package:adc_monitoring/ui/navigation/big_panda.dart';
import 'package:adc_monitoring/ui/navigation/info.dart';
import 'package:flutter/material.dart';
import 'package:adc_monitoring/ui/navigation/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

void main() {
  initDatabase();
  runApp(MyApp());
}

void initDatabase() {
  var path = Directory.current.path;
  Hive.init(path);
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [MyHomePage(), BigPanda(), Info()];
  String barcode = '';

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String barTitle(int index) {
    if (index == 0) {
      return BaseText.title + ' - Home';
    } else if (index == 1) {
      return 'BigPanda';
    } else if (index == 2) {
      return 'Info';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: BaseText.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: appBarCustom(context),
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.insert_chart),
                title: new Text('BigPanda'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info), title: Text('Info'))
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarCustom(BuildContext context) {
    return AppBar(
      title: Text(barTitle(_currentIndex)),
      actions: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            tooltip: 'Scanner Qr Code',
            onPressed: () =>
                Navigation.primitiveNavigation(context, QrScanner())),
      ],
    );
  }
}
