import 'package:wook_application/feed/post.dart';
import 'file:///F:/flutter/wook_application/lib/feed/story/stories.dart';

class Data {
  static final List<Post> dummyData = [
    Post(
      photoUrl:
      "https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
      name: "Paul",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "a",
      numberOfLikes: 3,
    ),
    Post(
      photoUrl:
      "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "Mike",
      datetime: "00:56",
      message: "How about meeting tomorrow?",
      id: "b",
      numberOfLikes: 17,
    ),
    Post(
      photoUrl:
      "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "Helen",
      datetime: "03:34",
      message: "How about meeting tomorrow?",
      id: "c",
      numberOfLikes: 23,
    ),
    Post(
      photoUrl:
      "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "David",
      datetime: "19:18",
      message: "How about meeting tomorrow?",
      id: "q",
      numberOfLikes: 67,
    ),
    Post(
      photoUrl:
      "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "Laurent",
      datetime: "22:10",
      message: "How about meeting tomorrow?",
      id: "m",
      numberOfLikes: 39,
    ),
  ];

  static final List<Story> dummyDataStories = [
    Story(
        photoUrl: "https://images.unsplash.com/photo-1494548162494-384bba4ab999?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80",
        name: "Paul",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "a1"
    ),
    Story(
        photoUrl: "https://pbs.twimg.com/media/EjgcBajWkAE1FsA?format=jpg&name=large",
        name: "Mike",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "b1"
    ),
    Story(
        photoUrl: "https://i0.wp.com/www.foodrepublic.com/wp-content/uploads/2011/11/Screen-Shot-2011-11-14-at-1.58.59-PMMR.jpg?resize=700%2C%20449&ssl=1",
        name: "Helen",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "c1"
    ),
    Story(
        photoUrl: "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-2.jpg",
        name: "David",
        datetime: "19:18",
        message: "How about meeting tomorrow?",
        id: "q1"
    ),
    Story(
        photoUrl: "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-4.jpg",
        name: "Laurent",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "m1"
    ),
  ];

}