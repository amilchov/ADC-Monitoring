
import 'package:charts_common/src/common/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class QrSeries {
  final String type;
  final int value;
  final charts.Color color;

  QrSeries({@required this.type, @required this.value, @required this.color});
}
