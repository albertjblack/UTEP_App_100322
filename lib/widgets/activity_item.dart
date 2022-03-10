import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Icon? icon;

  ActivityItem(this.id, this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          id == "Learn"
              ? "/learn"
              : id == "Local Events"
                  ? "/local-events"
                  : id == "Get Involved"
                      ? "/get-involved"
                      : "/daily-facts",
          arguments: {'id': id, 'title': title}),
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
