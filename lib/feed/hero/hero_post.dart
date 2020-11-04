import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/util/hex_color.dart';

class HeroPost extends StatefulWidget {
  String photoUrl;
  String name;
  String datetime;
  String message;
  String id;
  int numberOfLikes;

  final Function doLikeFunction;
  int nLikes;

  HeroPost(
      {this.photoUrl,
      this.name,
      this.datetime,
      this.message,
      this.id,
      this.numberOfLikes,
      this.doLikeFunction});

  @override
  _HeroPostState createState() => _HeroPostState();
}

class _HeroPostState extends State<HeroPost> {
  @override
  Widget build(BuildContext context) {
    double iconRadius = 100;

    return Scaffold(
      backgroundColor: HexColor.fromHex("#F2EFE9"),
      appBar: AppBar(
        backgroundColor: HexColor.fromHex("#F2EFE9"),
      ),
      body: Column(children: <Widget>[
        Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Hero(
                  tag: '${widget.id}',
                  child: Image.network(widget.photoUrl),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _commentLikeDirect(),
          ),
        ),
      ]),
    );
  }

  List<Widget> _commentLikeDirect() {
    return [
      IconButton(
        icon: Icon(
          Icons.favorite,
          color: HexColor.fromHex("#564E58"),
        ),
        onPressed: () {
          setState(() {
            widget.doLikeFunction(1);
          });
        },
      ),
      Text(
        ' ${widget.numberOfLikes}',
        style: TextStyle(
            color: widget.numberOfLikes == 0 ? Colors.white : Colors.red),
      ),
      IconButton(
        icon: new Icon(FontAwesomeIcons.book),
        color: HexColor.fromHex("#564E58"),
        onPressed: () {
          //todo make cart adding
        },
      ),
      new IconButton(
        icon: new Icon(FontAwesomeIcons.comment),
        color: HexColor.fromHex("#564E58"),
        onPressed: () {
          setState(() {});
        },
      ),
    ];
  }
}
