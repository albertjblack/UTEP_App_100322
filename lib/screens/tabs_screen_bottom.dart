import 'dart:io';

import './../screens/stats/stats.dart';

import './../screens/activities_screen.dart';
import './../screens/scoreboard/scoreboard.dart';
import './../screens/user_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './categories_screen.dart';

class TabsScreenBottom extends StatefulWidget {
  @override
  _TabsScreenBottomState createState() => _TabsScreenBottomState();
}

class _TabsScreenBottomState extends State<TabsScreenBottom> {
  List<Map> _screens = [{}];

  @override
  initState() {
    _screens = [
      {'screen': CategoriesScreen(), 'title': 'Ride'},
      {'screen': ActivitiesScreen(), 'title': 'Activities'},
      {'screen': ScoreBoard(), 'title': 'Score Board'},
      {'screen': StatsScreen(), 'title': 'Stats'},
    ];
    super.initState();
  }

  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  PreferredSizeWidget get_appBar(title, ctx) {
    if (Platform.isIOS)
      return (CupertinoNavigationBar(
        middle: Image.asset(
          "assets/images/static/kpmg.png",
          height: 30,
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          width: 82,
          child: const Text(
            "73 points",
            style: TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white))),
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UserProfileScreen.routeName);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/static/profilePic.jpg",
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      )) as PreferredSizeWidget;
    else
      return (AppBar(
        title: Image.asset(
          "assets/images/static/kpmg.png",
          height: 30,
        ),
      )) as PreferredSizeWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_appBar(_screens[_selectedScreenIndex]['title'], context),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis_circle), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.checkmark_seal_fill), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_alt_fill), label: ''),
        ],
      ),
    );
  }
}
