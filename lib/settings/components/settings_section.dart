import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wook_application/settings/components/settings_tile.dart';

import 'abstract_section.dart';



// ignore: must_be_immutable
class SettingsSection extends AbstractSection {
  final List<SettingsTile> tiles;
  final TextStyle titleTextStyle;

  SettingsSection({
    Key key,
    String title,
    this.tiles,
    this.titleTextStyle,
  }) : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
      return androidSection(context);
  }


  Widget androidSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      title == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: titleTextStyle ??
                    TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tiles.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return tiles[index];
        },
      ),
      if (showBottomDivider) Divider(height: 1)
    ]);
  }
}
