import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wook_application/feed/book/book_saved.dart';
import 'package:wook_application/profile/profile.dart';
import 'package:wook_application/settings/settings_screen.dart';

import 'bottom_navigation/destination.dart';
import 'feed/book/book.dart';
import 'feed/book/catalog.dart';
import 'feed/insta_list.dart';
import 'feed/story/story_seen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ignore: missing_required_param
          ChangeNotifierProvider<StorySeen>(create: (context) => StorySeen()),
          Provider(create: (context) => BookUnsavedModel()),
          ChangeNotifierProxyProvider<BookUnsavedModel, PostSavedModel>(
            create: (context) => PostSavedModel(),
            update: (context, catalog, bookseen) {
              bookseen.catalog = catalog;
              return bookseen;
            },
          ),
        ],
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: _currentIndex,
              children: allDestinations.map<Widget>((Destination destination) {
                switch (destination.title) {
                  case 'Home':
                    {
                      return InstaListView(destination);
                    }
                  case 'Cook Book':
                    {
                      return BookStorageView(destination: destination);
                    }
                  case 'Profile':
                    {
                      return ProfileView(destination: destination);
                    }
                  case 'Settings':
                    {
                      return SettingsView(destination: destination);
                    }
                }
              }).toList(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  backgroundColor: destination.color,
                  label: destination.title);
            }).toList(),
          ),
        ));
  }
}
