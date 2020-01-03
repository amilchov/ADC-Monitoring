import 'package:adc_monitoring/base_text.dart';
import 'package:adc_monitoring/components/widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: new Container(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Widgets.cardText(
                    context, BaseText.adcQuestion, BaseText.homePageTextADC),
                Widgets.cardText(context, BaseText.bigPandaQuestion,
                    BaseText.homePageTextBigPanda),
                Widgets.cardImagesAtlasCern(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
