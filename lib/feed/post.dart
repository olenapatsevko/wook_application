import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/feed/book/book_saved.dart';
import 'package:wook_application/feed/hero/hero_post.dart';
import 'package:wook_application/feed/story/detail.dart';
import 'package:wook_application/http/http_service.dart';
import 'package:wook_application/util/dummy_data.dart';
import 'package:wook_application/util/hex_color.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final String photoUrl;
  final String name;
  final String datetime;
  final String message;
  int id;
  int numberOfLikes;

  Post(
      {this.photoUrl,
      this.name,
      this.datetime,
      this.message,
      this.id,
      this.numberOfLikes});

// ignore: missing_return
  Post p(int id) {
    this.id = id;
  }

  Post findById(List<Post> list, int id) {
    return Data.dummyData.where((element) => (element.id == id)).first;
  }

  @override
  PostPageState createState() => PostPageState();

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      photoUrl: json['photoUrl'] as String,
      name: json['name'] as String,
      datetime: json['datetime'] as String,
      message: json['message'] as String,
      numberOfLikes: json['numberOfLikes'] as int,
      id: json['id'] as int,
    );
  }
}

class PostPageState extends State<Post> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Post post) => ListTile(
                      leading: Image.network(
                        post.photoUrl,
                      ),
                      title: Text(post.name),
                      subtitle: Text("Likes: ${post.numberOfLikes}"),
                      trailing: new _AddButton(
                        name: post.name,
                        datetime: post.datetime,
                        id: post.id,
                        message: post.message,
                        numberOfLikes: post.numberOfLikes,
                        photoUrl: post.photoUrl,
                      ),
                      onLongPress: () {
                        setState(() {
                          doLikeFunction(1, post);
                        });
                      },
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetail(
                            post: post,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void doLikeFunction(int nLikes, Post post) {
    setState(() {
      post.numberOfLikes +=1;
      widget.numberOfLikes += nLikes;
    });
  }
}

class _AddButton extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String datetime;
  final String message;
  final int id;
  final int numberOfLikes;

  const _AddButton(
      {Key key,
      this.photoUrl,
      this.name,
      this.datetime,
      this.message,
      this.id,
      this.numberOfLikes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<PostSavedModel, bool>(
      (cart) {
        for (Post p in cart.items) {
          if (p.id == this.id) {
            return true;
          }
        }
        return false;
      },
    );

    return FlatButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<PostSavedModel>();
              cart.add(new Post(
                name: name,
                datetime: datetime,
                id: id,
                message: message,
                numberOfLikes: numberOfLikes,
                photoUrl: photoUrl,
              ));
            },
      splashColor: Theme.of(context).primaryColor,
      child: isInCart
          ? Icon(Icons.check, semanticLabel: 'ADDED')
          : new Icon(FontAwesomeIcons.book),
    );
  }
}
