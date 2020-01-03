import 'package:adc_monitoring/base_text.dart';
import 'package:adc_monitoring/components/widgets.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
                    context, BaseText.purposeProject, BaseText.purposeDefinition),
                Widgets.cardImagesAtlasCern(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
