import 'dart:typed_data';
import 'package:adc_monitoring/components/charts/qr_chart.dart';
import 'package:adc_monitoring/model/chart/qr_series.dart';
import 'package:adc_monitoring/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:charts_flutter/flutter.dart' as charts;

class QrScanner extends StatefulWidget {
  QrScanner({Key key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  List<QrSeries> data;
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    _scan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(context),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(
            child: _resultFromScan(context),
          ),
          this.barcode.isEmpty
              ? QrChart.isEmptyChart(context)
              : QrChart(
                  data: _seriesDataChart(),
                )
        ],
      )),
    );
  }

  Widget _resultFromScan(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        this.barcode.isEmpty
            ? Widgets.cardQrResults(context, "Minimum", "No data available",
                "Maximum", "No data available")
            : Widgets.cardQrResults(context, "Maximum", _getData(0).toString(),
                "Minimum", _getData(1).toString()),
        this.barcode.isEmpty
            ? Widgets.cardQrResults(context, "Curent", "No data available",
                "Avarage", "No data available")
            : Widgets.cardQrResults(context, "Avarage", _getData(2).toString(),
                "Current", _getData(3).toString())
      ],
    );
  }

  Future _scan() async {
    String barcodeFromScan = await scanner.scan();
    setState(() => this.barcode = barcodeFromScan);
  }

  List<QrSeries> _seriesDataChart() {
    if (this.barcode.isNotEmpty) {
      data = [
        QrSeries(
          type: "Maximum",
          value: _getData(0),
          color: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        QrSeries(
          type: "Minimum",
          value: _getData(1),
          color: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        QrSeries(
          type: "Avarage",
          value: _getData(2),
          color: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
        QrSeries(
          type: "Current",
          value: _getData(3),
          color: charts.ColorUtil.fromDartColor(Colors.blue),
        ),
      ];
      return data;
    }
  }

  int _getData(int index) {
    List<String> listOfData = barcode.split('\n').toList();

    if (index == 0) {
      // maximum
      String data = listOfData[0];
      List<String> list = data.split(' ').toList();
      list.removeRange(0, 2);
      print(list);
      return int.parse(list[0]);
    } else if (index == 1) {
      // minimum
      String data = listOfData[1];
      List<String> list = data.split(' ').toList();
      list.removeRange(0, 2);
      return int.parse(list[0]);
    } else if (index == 2) {
      // avarage
      String data = listOfData[2];
      List<String> list = data.split(' ').toList();
      list.removeRange(0, 2);
      return int.parse(list[0]);
    } else if (index == 3) {
      // current
      String data = listOfData[3];
      List<String> list = data.split(' ').toList();
      list.removeRange(0, 2);
      return int.parse(list[0]);
    }
  }

  Widget appBarCustom(BuildContext context) {
    return AppBar(
      title: Text("QR Code Scan"),
      actions: <Widget>[
        IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            tooltip: 'Scan QR',
            onPressed: () => _scan()),
      ],
    );
  }
}
