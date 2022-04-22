import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../data/models/chart_model.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  DeveloperChart({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, int>> series = [
      charts.Series(
        id: "developers",
        data: data,
        domainFn: (DeveloperSeries series, _) => int.parse(series.year),
        measureFn: (DeveloperSeries series, _) => series.developers,
        colorFn: (DeveloperSeries series, _) => series.barColor,
      )
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              // CustomText(text: "Weight historical", fontSize: 16),
              // Expanded(
              //   child: charts.BarChart(series, animate: true),
              // )
              Expanded(
                child: charts.LineChart(series,
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),

                      // viewport: charts.NumericExtents(1, 30),
                    ),
                    animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
