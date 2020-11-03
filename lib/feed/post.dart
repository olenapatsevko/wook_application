import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/feed/hero/hero_post.dart';
import 'package:wook_application/util/hex_color.dart';

class Post extends StatefulWidget {
  String photoUrl;
  String name;
  String datetime;
  String message;
  String id;
  int numberOfLikes;

  Post({this.photoUrl,
    this.name,
    this.datetime,
    this.message,
    this.id,
    this.numberOfLikes});

  Post.p(Post post){
    this.photoUrl = post.photoUrl;
    this.name = post.name;
    this.datetime = datetime;
    this.message = post.message;
    this.id = post.id;
    this.numberOfLikes = post.numberOfLikes;
  }


  static final List<Post> dummyData = [
    Post(
      photoUrl:
      "https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_764,h_955/k%2FPhoto%2FRecipes%2F2019-07-how-to-easy-chicken-piccata%2F190625-the-kitchn-christine-han-photography-144",
      name: "Paul",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "a",
      numberOfLikes: 3,
    ),
    Post(
      photoUrl:
      "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "Mike",
      datetime: "00:56",
      message: "How about meeting tomorrow?",
      id: "b",
      numberOfLikes: 17,
    ),
    Post(
      photoUrl:
      "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?webp=true&quality=90&resize=620%2C563",
      name: "Helen",
      datetime: "03:34",
      message: "How about meeting tomorrow?",
      id: "c",
      numberOfLikes: 23,
    ),
    Post(
      photoUrl:
      "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-4.jpg",
      name: "David",
      datetime: "19:18",
      message: "How about meeting tomorrow?",
      id: "q",
      numberOfLikes: 67,
    ),
    Post(
      photoUrl:
      "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1528394829%2FGenTsoChickenAirFry.jpg%3Fitok%3DFSMg2nSW",
      name: "Laurent",
      datetime: "22:10",
      message: "How about meeting tomorrow?",
      id: "m",
      numberOfLikes: 39,
    ),
  ];

  @override
  PostPageState createState() => PostPageState();

}

class PostPageState extends State<Post> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
                  return HeroPhotoPage(name: widget.name,
                      datetime: widget.datetime,
                      id: widget.id,
                      message: widget.message,
                      numberOfLikes: widget.numberOfLikes,
                      photoUrl: widget.photoUrl, doLikeFunction: doLikeFunction);
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
                            //   isPressedHeart = !isPressedHeart;
                          });
                        },
                      ),
                      new SizedBox(
                        width: 5.0,
                      ),
                      new IconButton(
                        icon: new Icon(FontAwesomeIcons.book),
                        color //: //isPressedBook
                        //? HexColor.fromHex("#904E55")
                            : HexColor.fromHex("#564E58"),
                        onPressed: () {
                          setState(() {
                            //  isPressedBook = !isPressedBook;
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
              child: Text(
                  widget.datetime, style: TextStyle(color: Colors.grey)),
            )
          ],
        ));
  }

  void doLikeFunction(int nLikes) {
    setState(() {
      widget.numberOfLikes += nLikes;
    });
  }
}
