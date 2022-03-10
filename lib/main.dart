import 'dart:io';
import "./screens/stats/stats.dart";

import './screens/activities/daily-facts.dart';
import './screens/activities/get-involved.dart';
import './screens/activities/learn_screen.dart';
import './screens/activities/local-events.dart';
import './screens/activities_screen.dart';
import './screens/scoreboard/scoreboard.dart';
import './screens/user_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './screens/tabs_screen_bottom.dart';
import './screens/categories_screen.dart';

import './screens/go_screen.dart';

import './data/dummy_data.dart';

import './constants/colors.dart';
import './constants/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-KPMG',
        theme: ThemeData(
            primarySwatch: generateMaterialColor(Color(primaryColor)),
            secondaryHeaderColor: Color(secondaryColor),
            canvasColor: Color(0xFFF4F4F4),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline5:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreenBottom(),
          GoScreen.routeName: (ctx) => GoScreen(),
          UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
          ActivitiesScreen.routeName: (ctx) => ActivitiesScreen(),
          LearnScreen.routeName: (ctx) => LearnScreen(),
          EventsScreen.routeName: (ctx) => EventsScreen(),
          GetInvolvedScreen.routeName: (ctx) => GetInvolvedScreen(),
          DailyFacts.routeName: (ctx) => DailyFacts(),
          ScoreBoard.routeName: (ctx) => ScoreBoard(),
          StatsScreen.routeName: (ctx) => StatsScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}
