import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

const DUMMY_SCORES = [
  {"username": "albertjblack", "total": "73", "rank": "1"},
  {"username": "kazmadrid", "total": "69", "rank": "2"},
  {"username": "lilian12", "total": "66", "rank": "3"},
  {"username": "brendilla", "total": "64", "rank": "4"},
  {"username": "luisillo", "total": "55", "rank": "5"},
  {"username": "mariarom", "total": "49", "rank": "6"},
  {"username": "crystalin", "total": "46", "rank": "7"},
];

class ScoreBoard extends StatelessWidget {
  static const routeName = "/score-board";
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: size.height * 0.78,
            child: ListView.builder(
                itemCount: DUMMY_SCORES.length,
                itemBuilder: ((context, index) => Container(
                    width: size.width,
                    height: 180,
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: index % 2 == 0
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).secondaryHeaderColor,
                                width: 2))),
                    child: ListTile(
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@" + DUMMY_SCORES[index]["username"].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      title: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: index % 2 == 0
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).primaryColor),
                        child: Text(
                          DUMMY_SCORES[index]["total"].toString() + " points",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      trailing: CircleAvatar(
                          backgroundColor: index % 2 == 0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                          child: Text(
                            "#" + DUMMY_SCORES[index]["rank"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ))))),
      ],
    ));
  }
}
