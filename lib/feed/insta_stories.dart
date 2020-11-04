import 'package:flutter/material.dart';
import 'package:wook_application/feed/stories.dart';
import 'package:wook_application/util/dummy_data.dart';

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
          itemCount: Data.dummyDataStories.length,
          itemBuilder: (context, index) {
            Stories _stories = Data.dummyDataStories[index];
            return new Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  new Container(
                    child: GestureDetector(
                      child: Hero(
                        tag: _stories.id,
                        child: Image.network(
                          _stories.photoUrl,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return StoriesScreen(_stories);
                        }));
                      },
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                ]);
          }),
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
class StoriesScreen extends StatelessWidget {
  final Stories _post;

  StoriesScreen(this._post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: _post.id,
            child: Image.network(_post.photoUrl),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}