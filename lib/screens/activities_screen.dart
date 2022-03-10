import './../data/dummy_activities.dart';
import 'package:flutter/material.dart';

import '../widgets/activity_item.dart';

class ActivitiesScreen extends StatelessWidget {
  static const routeName = "/activities";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select activity",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? 200
              : 400,
          child: GridView(
              padding: const EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              children: DUMMY_ACTIVITIES
                  .map((catData) => Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: ActivityItem(
                                  catData.id, catData.title, catData.icon)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(catData.title!,
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
