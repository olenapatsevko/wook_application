import 'package:flutter/material.dart';
import 'package:wook_application/bottom_navigation/destination.dart';
import 'package:wook_application/util/hex_color.dart';

class ProfileView extends StatefulWidget {
  final Destination destination;

  const ProfileView({Key key, this.destination}) : super(key: key);

  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.destination.title,
          ),
          backgroundColor: widget.destination.color,
        ),
        body: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      HexColor.fromHex("#BFB48F"),
                      HexColor.fromHex("#904E55")
                    ])),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://miro.medium.com/max/875/1*ptA8nriUFoDc7wrAvV5O7g.jpeg",
                          ),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Olena Patsevko",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Posts",
                                        style: TextStyle(
                                          color: HexColor.fromHex("#BFB48F"),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "5200",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: HexColor.fromHex("#904E55"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          color: HexColor.fromHex("#BFB48F"),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "28.5K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: HexColor.fromHex("#904E55"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Follow",
                                        style: TextStyle(
                                          color: HexColor.fromHex("#BFB48F"),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "1300",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: HexColor.fromHex("#904E55"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}
