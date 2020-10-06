class Stories {
  final String photoUrl;
  final String name;
  final String datetime;
  final String message;
  final String id;

  Stories({this.photoUrl, this.name, this.datetime, this.message, this.id});

  static final List<Stories> dummyData = [
    Stories(
        photoUrl: "https://leonardo2.akamaized.net/e02db860-3590-e083-a0cf-dea9d535a267/",
        name: "Paul",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "a1"
    ),
    Stories(
        photoUrl: "https://pbs.twimg.com/media/EjgcBajWkAE1FsA?format=jpg&name=large",
        name: "Mike",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "b1"
    ),
    Stories(
        photoUrl: "https://i0.wp.com/www.foodrepublic.com/wp-content/uploads/2011/11/Screen-Shot-2011-11-14-at-1.58.59-PMMR.jpg?resize=700%2C%20449&ssl=1",
        name: "Helen",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "c1"
    ),
    Stories(
        photoUrl: "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-2.jpg",
        name: "David",
        datetime: "19:18",
        message: "How about meeting tomorrow?",
        id: "q1"
    ),
    Stories(
        photoUrl: "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-4.jpg",
        name: "Laurent",
        datetime: "20:18",
        message: "How about meeting tomorrow?",
        id: "m1"
    ),
  ];
}