import './../../data/dummy_involved.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

PreferredSizeWidget get_appBar(title) {
  if (Platform.isIOS)
    return (CupertinoNavigationBar(middle: Text(title))) as PreferredSizeWidget;
  else
    return (AppBar(title: Text(title))) as PreferredSizeWidget;
}

class GetInvolvedScreen extends StatelessWidget {
  const GetInvolvedScreen({Key? key}) : super(key: key);
  static const routeName = "/get-involved";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: get_appBar("Get Involved"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: size.height * 0.8,
                child: ListView.builder(
                    itemCount: DUMMY_INVOLVED.length,
                    itemBuilder: ((context, index) => Container(
                        width: size.width,
                        height: 200,
                        padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: index % 2 == 0
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context)
                                            .secondaryHeaderColor,
                                    width: 2))),
                        child: ListTile(
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DUMMY_INVOLVED[index]["description"],
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
                              DUMMY_INVOLVED[index]["title"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: CircleAvatar(
                              backgroundColor: index % 2 == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).secondaryHeaderColor,
                              child: Text(
                                "+" + DUMMY_INVOLVED[index]["points"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ))))),
          ],
        ));
  }
}
