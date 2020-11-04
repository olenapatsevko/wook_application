import 'package:flutter/material.dart';
import 'package:wook_application/direct/direct_messages_body.dart';
import 'package:wook_application/feed/insta_body.dart';
import 'package:wook_application/feed/story/story_seen.dart';
import 'package:wook_application/profile/profile.dart';
import 'package:wook_application/settings/settings_screen.dart';
import 'package:wook_application/util/hex_color.dart';
import 'package:provider/provider.dart';


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
                child: DirectBody(),
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
                icon: new Icon(Icons.message_sharp),
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
