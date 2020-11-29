import 'package:flutter/material.dart';
import 'package:wook_application/animation/chart.dart';
import 'package:wook_application/bottom_navigation/destination.dart';
import 'package:wook_application/settings/components/settings_list.dart';
import 'package:wook_application/settings/components/settings_section.dart';
import 'package:wook_application/settings/components/settings_tile.dart';

import 'languages_screen.dart';

class SettingsView extends StatefulWidget {
  final Destination destination;

  const SettingsView({Key key, this.destination}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.destination.title,
        ),
        backgroundColor: widget.destination.color,
      ),
      body: SettingsList(
        // backgroundColor: Colors.orange,

        sections: [
          SettingsSection(
            title: 'Common',
            // titleTextStyle: TextStyle(fontSize: 30),
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
              SettingsTile(
                title: 'Exit',
                subtitle: 'Exit an app',
                leading: Icon(Icons.exit_to_app),
                onTap: () => Navigator.popAndPushNamed(context, '/second'),
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                title: 'Chart',
                leading: Icon(Icons.bar_chart),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ChartView()));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
