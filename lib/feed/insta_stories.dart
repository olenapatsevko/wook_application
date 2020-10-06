import 'package:flutter/material.dart';
import 'package:wook_application/util/hex_color.dart';

class InstaStories extends StatelessWidget {
  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Stories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );

  final stories = Expanded(
    child: new Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => new Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                new Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://miro.medium.com/max/875/1*ptA8nriUFoDc7wrAvV5O7g.jpeg",
                    ),
                    radius: 20.0,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                ),
                index == 0
                    ? Positioned(
                        right: 10.0,
                        child: new CircleAvatar(
                          backgroundColor: HexColor.fromHex("#904E55"),
                          radius: 10.0,
                          child: new Icon(
                            Icons.add,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        )
                )
                    : new Container()
              ],
            ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}
