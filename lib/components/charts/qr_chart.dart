import 'package:adc_monitoring/custom.dart';
import 'package:adc_monitoring/model/chart/qr_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class QrChart extends StatelessWidget {
  final List<QrSeries> data;

  QrChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<QrSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          labelAccessorFn: (QrSeries series, _) =>
              '\$${series.value.toString()}',
          domainFn: (QrSeries series, _) => series.type,
          measureFn: (QrSeries series, _) => series.value,
          colorFn: (QrSeries series, _) => series.color),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Data from QR Code",
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  behaviors: [
                    new charts.PanAndZoomBehavior()
                  ],
                  barRendererDecorator: new charts.BarLabelDecorator<String>(),
                  domainAxis: new charts.OrdinalAxisSpec(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget isEmptyChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  "No data",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Custom.hexToColor('#808080')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
