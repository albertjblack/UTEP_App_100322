import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

const DUMMY_ACTIVITIES = [
  Category(
      id: 'Learn',
      title: 'Learn',
      icon: Icon(
        Icons.computer,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Local Events',
      title: 'Local Events',
      icon: Icon(
        Icons.calendar_month,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Get Involved',
      title: 'Get Involved',
      icon: Icon(
        Icons.games,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Daily Facts',
      title: 'Daily Facts',
      icon: Icon(
        CupertinoIcons.question,
        size: 100,
        color: Color(0xFF003087),
      )),
];
