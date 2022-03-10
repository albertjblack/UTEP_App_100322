import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import './../constants/co2.dart';

const DIST_TO_OFFICE = 16.8;

PreferredSizeWidget get_appBar(title) {
  if (Platform.isIOS)
    return (CupertinoNavigationBar(middle: Text(title))) as PreferredSizeWidget;
  else
    return (AppBar(title: Text(title))) as PreferredSizeWidget;
}

List<double> getReductionTime(String vehicle, double miles) {
  int _min = 1;
  double _redux = 0.845;
  double _min_secs_mile = 240;

  switch (vehicle) {
    case "Walk":
      _min_secs_mile = AVG_SECS_MILE_WALK;
      break;
    case "Bike & Scooter":
      _min_secs_mile = AVG_SECS_MILE_BIKE_SCOOTER;
      break;
    case "Carpool":
      _min = 2; // min 2
      _min_secs_mile = 0;
      break;
    case "Shuttle":
      _min = 3; // shuttle
      _min_secs_mile = 0;
      break;
    default:
  }

  if (_min_secs_mile == 0 || _min_secs_mile == 0.0) {
    return [_redux * miles, 100 * miles];
  }
  return [_redux * miles, _min_secs_mile * miles]; // redux, secs
}

class GoScreen extends StatefulWidget {
  GoScreen({Key? key}) : super(key: key);
  static const routeName = "/go";

  @override
  State<GoScreen> createState() => _GoScreenState();
}

class _GoScreenState extends State<GoScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = (ModalRoute.of(context)!.settings.arguments) as Map;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
        appBar: get_appBar(categoryTitle!),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  child: InkWell(
                    splashColor: Theme.of(context).secondaryHeaderColor,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text("Trip by: $categoryTitle"),
                                content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "$DIST_TO_OFFICE miles to the office"),
                                      Text(
                                          "Estimated time: ${((1 / 60) * (getReductionTime(categoryTitle, DIST_TO_OFFICE))[1]).toStringAsFixed(0)} minutes"),
                                      Text(
                                          "${(getReductionTime(categoryTitle, DIST_TO_OFFICE))[0].toStringAsFixed(2)} less pounds of CO2"),
                                      Text(""),
                                      Text("Tracking starts now"),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(fontSize: 14),
                                      )),
                                ],
                              ));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Go",
                          style: TextStyle(color: Colors.white, fontSize: 64),
                        ),
                      ],
                    ),
                  ),
                  minRadius: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Change starts with you",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ],
        ));
  }
}
