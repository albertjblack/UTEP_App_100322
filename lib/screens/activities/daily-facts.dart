import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'dart:io';

PreferredSizeWidget get_appBar(title) {
  if (Platform.isIOS)
    return (CupertinoNavigationBar(middle: Text(title))) as PreferredSizeWidget;
  else
    return (AppBar(title: Text(title))) as PreferredSizeWidget;
}

class DailyFacts extends StatelessWidget {
  const DailyFacts({Key? key}) : super(key: key);
  static const routeName = "/daily-facts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: get_appBar("Daily Facts"),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SwipingCardDeck(
                  cardDeck: <Card>[
                    Card(
                        color: Colors.red,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Did you know that recycling indirectly reduces carbon emissions?",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          height: 300,
                          width: 200,
                        )),
                    Card(
                        color: Colors.green,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Did you know that you could reduce carbon emissions by reading a book instead of watching netflix?",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          height: 300,
                          width: 200,
                        )),
                  ],
                  onDeckEmpty: () =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                    "You've completed the deck",
                    textAlign: TextAlign.center,
                  ))),
                  onLeftSwipe: (Card card) => debugPrint("Swiped left!"),
                  onRightSwipe: (Card card) => debugPrint("Swiped right!"),
                  swipeThreshold: MediaQuery.of(context).size.width / 4,
                  minimumVelocity: 1000,
                  cardWidth: 200,
                  rotationFactor: 0.8 / 3.14,
                  swipeAnimationDuration: const Duration(milliseconds: 500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Play the deck")
              ],
            ),
          ],
        ));
  }
}
