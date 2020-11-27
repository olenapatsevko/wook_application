import 'dart:convert';

import 'package:http/http.dart';
import 'package:wook_application/feed/post.dart';

class HttpService {
  final String postsURL = "https://my-json-server.typicode.com/olenapatsevko/demo/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}