import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select transportation",
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
              children: DUMMY_CATEGORIES
                  .map((catData) => Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: CategoryItem(
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
