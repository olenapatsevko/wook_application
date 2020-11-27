import 'package:flutter/material.dart';
import '../post.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.message),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text(post.name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${post.id}"),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${post.datetime}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}