import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/notifiers/LikeNotifier.dart';
import 'package:wook_application/util/hex_color.dart';
import 'post.dart';
import 'insta_stories.dart';
import 'package:provider/provider.dart';

class InstaList extends StatefulWidget {
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressedHeart = false;
  bool isPressedBook = false;

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
            Post _post = Post.dummyData[index];
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
                                      "https://t8x8a5p2.stackpathcdn.com/wp-content/uploads/2018/05/Birthday-Cake-1.webp")),
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Text(
                            _post.name,
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
                    tag: _post.id,
                    child: Image.network(
                      _post.photoUrl,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(_post);
                    }));
                  },
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ChangeNotifierProvider<LikeNotifier>(
                      builder: (_) => LikeNotifier(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new IconButton(
                                icon: new Icon(isPressedHeart
                                    ? Icons.favorite
                                    : FontAwesomeIcons.heart),
                                color: isPressedHeart
                                    ? HexColor.fromHex("#904E55")
                                    : HexColor.fromHex("#564E58"),
                                onPressed: () {
                                  setState(() {
                                    isPressedHeart = !isPressedHeart;
                                  });
                                },
                              ),
                              new SizedBox(
                                width: 5.0,
                              ),
                              new IconButton(
                                icon: new Icon(FontAwesomeIcons.book),
                                color: isPressedBook
                                    ? HexColor.fromHex("#904E55")
                                    : HexColor.fromHex("#564E58"),
                                onPressed: () {
                                  setState(() {
                                    isPressedBook = !isPressedBook;
                                  });
                                },
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
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Likes: " + _post.numberOfLikes.toString(),
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
                                  "https://images.immediate.co.uk/production/volatile/sites/2/2019/07/Tiramisu-d68a628.jpg?webp=true&quality=90&resize=940%2C399")),
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
                  child: Text(_post.datetime,
                      style: TextStyle(color: Colors.grey)),
                )
              ],
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
