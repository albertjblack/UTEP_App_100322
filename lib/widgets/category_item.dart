import 'package:flutter/material.dart';
import '../screens/go_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Icon? icon;

  CategoryItem(this.id, this.title, this.icon);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(GoScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).secondaryHeaderColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            icon as Icon,
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
