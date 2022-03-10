import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

const DUMMY_CATEGORIES = [
  Category(
      id: 'Walk',
      title: 'Walk',
      icon: Icon(
        Icons.directions_walk,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Bike & Scooter',
      title: 'Bike & Scooter',
      icon: Icon(
        Icons.pedal_bike_outlined,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Carpool',
      title: 'Carpool',
      icon: Icon(
        CupertinoIcons.car_detailed,
        size: 100,
        color: Color(0xFF003087),
      )),
  Category(
      id: 'Shuttle',
      title: 'Shuttle',
      icon: Icon(
        CupertinoIcons.bus,
        size: 100,
        color: Color(0xFF003087),
      )),
];
