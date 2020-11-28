import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wook_application/bottom_navigation/destination.dart';
import 'package:wook_application/feed/hero/hero_post.dart';
import 'package:wook_application/feed/post.dart';
import 'package:wook_application/util/hex_color.dart';

import 'book_saved.dart';

class BookStorageView extends StatefulWidget {

  final Destination destination;
  const BookStorageView({ Key key, this.destination }) : super(key: key);

  @override
  _CartList createState() => _CartList();
}

class _CartList extends State<BookStorageView> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<PostSavedModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      body: Container(
        color: HexColor.fromHex("#F2EFE9"),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 2.0, 8.0, 2.0),
                        child: GestureDetector(
                          child: Hero(
                            tag: cart.items[index].id.toString(),
                            child: Image.network(
                              cart.items[index].photoUrl,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return HeroPost(
                                  name: cart.items[index].name,
                                  datetime: cart.items[index].datetime,
                                  id: cart.items[index].id.toString(),
                                  message: cart.items[index].message,
                                  numberOfLikes:
                                      cart.items[index].numberOfLikes,
                                  photoUrl: cart.items[index].photoUrl,
                                  doLikeFunction:
                                      PostPageState().doLikeFunction);
                            }));
                          },
                        )),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        cart.remove(cart.items[index]);
                      },
                    ),
                    title: Text(
                      cart.items[index].name,
                    ),
                  ),
                ),
              ),
            ),
            Divider(height: 4, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
