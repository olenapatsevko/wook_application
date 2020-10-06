class Post {
  final String photoUrl;
  final String name;
  final String datetime;
  final String message;
  final String id;

  Post({this.photoUrl, this.name, this.datetime, this.message, this.id});

  static final List<Post> dummyData = [
    Post(
      photoUrl: "https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_764,h_955/k%2FPhoto%2FRecipes%2F2019-07-how-to-easy-chicken-piccata%2F190625-the-kitchn-christine-han-photography-144",
      name: "Paul",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "a"
    ),
    Post(
      photoUrl: "https://blog-assets.shawacademy.com/uploads/2016/02/Cooked-food.jpg",
      name: "Mike",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "b"
    ),
    Post(
      photoUrl: "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?webp=true&quality=90&resize=620%2C563",
      name: "Helen",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "c"
    ),
    Post(
      photoUrl: "https://www.thenewsminute.com/sites/default/files/styles/news_detail/public/Main%20image_2.jpg?itok=MaEMWfzp",
      name: "David",
      datetime: "19:18",
      message: "How about meeting tomorrow?",
      id: "q"
    ),
    Post(
      photoUrl: "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1528394829%2FGenTsoChickenAirFry.jpg%3Fitok%3DFSMg2nSW",
      name: "Laurent",
      datetime: "20:18",
      message: "How about meeting tomorrow?",
      id: "m"
    ),
  ];
}