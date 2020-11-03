import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPhotoPage extends StatefulWidget {
  String photoUrl;
  String name;
  String datetime;
  String message;
  String id;
  int numberOfLikes;

  final Function doLikeFunction;
  int nLikes;

  HeroPhotoPage(
      {this.photoUrl,
        this.name,
        this.datetime,
        this.message,
        this.id,
        this.numberOfLikes, this.doLikeFunction});


  @override
  _HeroPhotoPageState createState() => _HeroPhotoPageState();
}

class _HeroPhotoPageState extends State<HeroPhotoPage> {
  @override
  Widget build(BuildContext context) {
    double iconRadius = 100;

    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text('${widget.name}'),
      ),
      body: Column(children: <Widget>[
        Stack(
          children: [
            Container(
              width: 200.0,
              height: 300.0,
              child: Hero(
                tag: '${widget.id}',
                child:Image.network( widget.photoUrl),
              ),
            ),
            _overflowingHeartSign(context, iconRadius),
          ],
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _commentLikeDirect(),
          ),
        ),
        Expanded(
            flex: 3,
            child: Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  widget.message,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )))
      ]),
      floatingActionButton: _downloadBtn(),
    );
  }

  Positioned _overflowingHeartSign(BuildContext context, double iconRadius) {
    return Positioned(
      left: (MediaQuery
          .of(context)
          .size
          .width / 2) - iconRadius,
      top: iconRadius,
      child: FlatButton(
          onPressed: () {
            int randomLikeQuantity = 2;
            setState(() {
              widget.nLikes += randomLikeQuantity;
            });
            widget.doLikeFunction(randomLikeQuantity);
          },
          child: Icon(
            Icons.favorite_border,
            color: Color.fromRGBO(255, 255, 255, 0.35),
            size: iconRadius * 2,
          )),
    );
  }

  List<Widget> _commentLikeDirect() {
    return [
      IconButton(
        icon: Icon(
          Icons.favorite,
          color: widget.nLikes == 0 ? Colors.white : Colors.red,
        ),
        onPressed: () {
          setState(() {
            widget.nLikes += 1;
          });
          widget.doLikeFunction(1);
        },
      ),
      Text(
        'Likes: ${widget.nLikes}',
        style: TextStyle(color: widget.nLikes == 0 ? Colors.white : Colors.red),
      ),
      IconButton(
        icon: Icon(
          Icons.mode_comment,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ];
  }

  FloatingActionButton _downloadBtn() {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'download',
      child: Icon(Icons.file_download, color: Colors.green),
    );
  }
}
