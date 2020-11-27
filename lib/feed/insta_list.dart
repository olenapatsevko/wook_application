import 'package:flutter/material.dart';
import 'package:wook_application/util/dummy_data.dart';
import 'post.dart';
import 'story/insta_stories.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  @override
  Widget build(BuildContext context) {
    return new Post();

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
