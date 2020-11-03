import 'package:flutter/material.dart';
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
        itemCount: Post.dummyData.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new SizedBox(
              child: new InstaStories(),
              height: deviceSize.height * 0.15,
            );
          } else if (index < Post.dummyData.length) {
            return Post.p(Post.dummyData[index]);
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
