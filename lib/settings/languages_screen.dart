import 'package:flutter/material.dart';
import 'package:wook_application/settings/components/settings_section.dart';
import 'package:wook_application/settings/components/settings_tile.dart';
import 'components/settings_list.dart';


class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "English",
              trailing: trailingWidget(0),
              onTap: () {
                changeLanguage(0);
              },
            ),
            SettingsTile(
              title: "Spanish",
              trailing: trailingWidget(1),
              onTap: () {
                changeLanguage(1);
              },
            ),
            SettingsTile(
              title: "Chinese",
              trailing: trailingWidget(2),
              onTap: () {
                changeLanguage(2);
              },
            ),
            SettingsTile(
              title: "German",
              trailing: trailingWidget(3),
              onTap: () {
                changeLanguage(3);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      languageIndex = index;
    });
  }
}
