import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/feed/book/book_saved.dart';
import 'package:wook_application/feed/hero/hero_post.dart';
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
}

class PostPageState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg")),
                    ),
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  new Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              new IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: null,
              )
            ],
          ),
        ),
        GestureDetector(
          child: Hero(
            tag: widget.id,
            child: Image.network(
              widget.photoUrl,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return HeroPost(
                  name: widget.name,
                  datetime: widget.datetime,
                  id: widget.id.toString(),
                  message: widget.message,
                  numberOfLikes: widget.numberOfLikes,
                  photoUrl: widget.photoUrl,
                  doLikeFunction: doLikeFunction);
            }));
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.favorite),
                    color: HexColor.fromHex("#564E58"),
                    onPressed: () {
                      setState(() {
                        doLikeFunction(1);
                      });
                    },
                  ),
                  new SizedBox(
                    width: 5.0,
                  ),
                  new _AddButton(
                    name: widget.name,
                    datetime: widget.datetime,
                    id: widget.id,
                    message: widget.message,
                    numberOfLikes: widget.numberOfLikes,
                    photoUrl: widget.photoUrl,
                  ),
                  new SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
              new IconButton(
                icon: new Icon(FontAwesomeIcons.comment),
                color: HexColor.fromHex("#564E58"),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Likes: " + widget.numberOfLikes.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg")),
                ),
              ),
              new SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: new TextField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add a comment...",
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(widget.datetime, style: TextStyle(color: Colors.grey)),
        )
      ],
    );
  }

 void doLikeFunction(int nLikes) {
    setState(() {
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
            for(Post p in cart.items){
              if(p.id == this.id){
                return true;
              }
            }
            return false;

      },
    )

    ;

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
      child: isInCart ? Icon(Icons.check, semanticLabel: 'ADDED') : new Icon(FontAwesomeIcons.book),
    );
  }
}
