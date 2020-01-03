import 'package:adc_monitoring/components/widgets.dart';
import 'package:adc_monitoring/custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigPandaCategories extends StatefulWidget {
  BigPandaCategories({Key key}) : super(key: key);

  @override
  _BigPandaCategoriesState createState() => _BigPandaCategoriesState();
}

class _BigPandaCategoriesState extends State<BigPandaCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GestureDetector(
          // onTap: () => onTapCard(),
          child: Column(
        children: <Widget>[
          Widgets.categoriesListTile("Normal (grid+cloud+hpc)"),
          Widgets.categoriesListTile("Normal (grid+cloud+hpc)"),
          Widgets.categoriesListTile("Normal (grid+cloud+hpc)"),
        ],
      )),
    );
  }
}
