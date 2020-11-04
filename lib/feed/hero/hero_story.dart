import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wook_application/feed/story/story_seen.dart';
import 'package:wook_application/util/hex_color.dart';

class HeroStory extends StatelessWidget {
  final String username;
  final String id;
  final String image;

  HeroStory({this.username, this.id, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#F2EFE9"),
      appBar: AppBar(
        title: Text('$username'),
      ),
      body: Column(children: <Widget>[
        Container(
          child: Hero(
            tag: '$id',
            child: Image.network(image),
          ),
        ),
        Text(
          "views " + _populateViewsCount(context, id),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black),
        )
      ]),
      floatingActionButton: _markStorySeenBtn(context, id),
    );
  }

  FloatingActionButton _markStorySeenBtn(BuildContext context, String tag) {
    var isAlreadySeen = context.select<StorySeen, bool>(
          (storyModel) => storyModel.storiesPartitionMap[true]
          .map((story) => story.id)
          .contains(tag),
    );

    return FloatingActionButton(
      onPressed: () {
        final model = Provider.of<StorySeen>(context,  listen: false);
        model.seeTheStoryByTag(tag);
      },
      child: Icon(Icons.remove_red_eye,
          color: isAlreadySeen ? HexColor.fromHex("#904E55") : HexColor.fromHex("#BFB48F")),
    );
  }

  String _populateViewsCount(context, String storyTag) {
    final model = Provider.of<StorySeen>(context);
    return model.getViewsCountByStoryTag(storyTag).toString();
  }

}