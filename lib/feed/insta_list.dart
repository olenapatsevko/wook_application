import 'package:flutter/material.dart';
import 'package:wook_application/util/dummy_data.dart';
import 'post.dart';
import 'insta_stories.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: Data.dummyData.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new SizedBox(
              child: new InstaStories(),
              height: deviceSize.height * 0.15,
            );
          } else if (index < Data.dummyData.length) {
            Post _post = Data.dummyData[index];
            return Post(
              photoUrl: _post.photoUrl,
              numberOfLikes: _post.numberOfLikes,
              message: _post.message,
              id: _post.id,
              datetime: _post.datetime,
              name: _post.name,

            );
          } else {
            return Column();
          }
        });
  }
}

class DetailScreen extends StatelessWidget {
  final Post _post;

  DetailScreen(this._post);

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
