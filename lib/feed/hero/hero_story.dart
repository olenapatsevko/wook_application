import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wook_application/feed/story/story_seen.dart';

class HeroStory extends StatelessWidget {
  final String username;
  final String id;
  final String image;

  HeroStory({this.username, this.id, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
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
          "view count: " + _populateViewsCount(context, id),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        )
      ]),
      floatingActionButton: _markStorySeenBtn(context, id),
    );
  }

  FloatingActionButton _markStorySeenBtn(BuildContext context, String tag) {
    var isAlreadySeen = context.select<StorySeen, bool>(
          (storyModel) => storyModel.storiesPartitionMap[StoryStatus.SEEN]
          .map((story) => story.id)
          .contains(tag),
    );

    return FloatingActionButton(
      onPressed: () {
        final model = Provider.of<StorySeen>(context,  listen: false);
        model.seeTheStoryByTag(tag);
      },
      tooltip: 'mark as seen',
      child: Icon(Icons.remove_red_eye,
          color: isAlreadySeen ? Colors.red : Colors.green),
    );
  }

  String _populateViewsCount(context, String storyTag) {
    final model = Provider.of<StorySeen>(context);
    return model.getViewsCountByStoryTag(storyTag).toString();
  }

}