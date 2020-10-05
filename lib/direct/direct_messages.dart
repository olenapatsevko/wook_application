import 'package:flutter/material.dart';
import 'package:wook_application/feed/insta_list.dart';
import 'chat_model.dart';

class DirectMessages extends StatefulWidget {
  @override
  _DirectMessagesState createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ChatModel.dummyData.length,
      itemBuilder: (context, index) {
        ChatModel _model = ChatModel.dummyData[index];
        return Column(
          children: <Widget>[
            Divider(
              height: 12.0,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 24.0,
                backgroundImage: NetworkImage(_model.avatarUrl),
              ),
              title: Row(
                children: <Widget>[
                  Text(_model.name),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    _model.datetime,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              subtitle: Text(_model.message),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 14.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
