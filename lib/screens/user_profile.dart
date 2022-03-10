import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

PreferredSizeWidget get_appBar(title) {
  if (Platform.isIOS)
    return (CupertinoNavigationBar(middle: Text(title))) as PreferredSizeWidget;
  else
    return (AppBar(title: Text(title))) as PreferredSizeWidget;
}

class UserProfileScreen extends StatefulWidget {
  static const routeName = "/profile";
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: get_appBar(""),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).secondaryHeaderColor,
                          width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/images/static/profilePic.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "@albertjblack",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Jose Robles",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Algo Developer",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "79902",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "El Paso",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Interests",
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_downward)
                      ],
                    ),
                  ),
                ],
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Working out",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Learning",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Outdoors",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Dogs",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100)),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Music",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Reading",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                child: Icon(Icons.edit),
              )
            ],
          ),
        ));
  }
}
