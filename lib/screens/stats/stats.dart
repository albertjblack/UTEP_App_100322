import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

const DUMMY_STATS = [
  {
    "vehicle": "bike/scooter",
    "user": "me",
    "reduction": "130",
    "miles": "153.85"
  },
  {"vehicle": "carpool", "user": "me", "reduction": "290", "miles": "343.20"},
  {"vehicle": "walk", "user": "me", "reduction": "80", "miles": "98.68"},
  {"vehicle": "shuttle", "user": "me", "reduction": "265", "miles": "313.6"},
];

///

class Co2PerVehicle {
  final String Vehicle;
  final int Co2;
  final charts.Color color;

  Co2PerVehicle(this.Vehicle, this.Co2, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

///

class StatsScreen extends StatelessWidget {
  static const routeName = "/stats";
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      Co2PerVehicle(
          'Bicycle/scooter', 130, Theme.of(context).secondaryHeaderColor),
      Co2PerVehicle('Carpool', 290, Theme.of(context).secondaryHeaderColor),
      Co2PerVehicle('Shuttle', 265, Theme.of(context).secondaryHeaderColor),
      Co2PerVehicle('Walk', 80, Theme.of(context).secondaryHeaderColor),
    ];
    var data2 = [
      Co2PerVehicle('Bicycle/scooter', 32000, Theme.of(context).primaryColor),
      Co2PerVehicle('Carpool', 22390, Theme.of(context).primaryColor),
      Co2PerVehicle('Shuttle', 26125, Theme.of(context).primaryColor),
      Co2PerVehicle('Walk', 18082, Theme.of(context).primaryColor),
    ];

    var series = [
      charts.Series(
        domainFn: (Co2PerVehicle clickData, _) => clickData.Vehicle,
        measureFn: (Co2PerVehicle clickData, _) => clickData.Co2,
        colorFn: (Co2PerVehicle clickData, _) => clickData.color,
        id: 'Co2',
        data: data,
      ),
    ];
    var series2 = [
      charts.Series(
        domainFn: (Co2PerVehicle clickData, _) => clickData.Vehicle,
        measureFn: (Co2PerVehicle clickData, _) => clickData.Co2,
        colorFn: (Co2PerVehicle clickData, _) => clickData.color,
        id: 'Co2Kpmg',
        data: data2,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );
    var chart2 = charts.BarChart(
      series2,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    var chartWidget2 = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart2,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
            ),
            Text('Co2 reduced by @albertjblack (lb)'),
            chartWidget,
            Text('Co2 reduced by KPMG (lb)'),
            Text(
              '',
            ),
            chartWidget2,
          ],
        ),
      ),
    );
  }
}
