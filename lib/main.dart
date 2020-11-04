import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wook_application/feed/book/book_saved.dart';
import 'package:wook_application/feed/insta_body.dart';
import 'package:wook_application/feed/story/story_seen.dart';
import 'package:wook_application/profile/profile.dart';
import 'package:wook_application/settings/settings_screen.dart';
import 'package:wook_application/util/hex_color.dart';
import 'package:provider/provider.dart';

import 'feed/book/book.dart';
import 'feed/book/catalog.dart';


void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider<StorySeen>(
            create: (context) => StorySeen()

            ),
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => BookUnsavedModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<BookUnsavedModel, PostSavedModel>(
          create: (context) => PostSavedModel(),
          update: (context, catalog, bookseen) {
            bookseen.catalog = catalog;
            return bookseen;
          },
        ),
      ],
    child: MaterialApp(
      color: HexColor.fromHex("#F2EFE9"),
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                child: InstaBody(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
              new Container(
                child: BookStorage(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
              new Container(
                child: Profile(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
              new Container(
                child: SettingsScreen(),
                color: HexColor.fromHex("#F2EFE9"),
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.book),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(
                icon: new Icon(Icons.settings),
              )
            ],
            labelColor: Colors.black87,
            unselectedLabelColor: HexColor.fromHex("#564E58"),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: HexColor.fromHex("#904E55"),
          ),
          backgroundColor: HexColor.fromHex("#BFB48F"),
        ),
      ),
    ));
  }
}
