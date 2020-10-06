class Post {
  final String photoUrl;
  final String name;
  final String datetime;
  final String message;
  final String id;
  final int numberOfLikes;

  Post(
      {this.photoUrl,
      this.name,
      this.datetime,
      this.message,
      this.id,
      this.numberOfLikes});

  static final List<Post> dummyData = [
    Post(
      photoUrl:
          "https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fit,w_764,h_955/k%2FPhoto%2FRecipes%2F2019-07-how-to-easy-chicken-piccata%2F190625-the-kitchn-christine-han-photography-144",
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
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?webp=true&quality=90&resize=620%2C563",
      name: "Helen",
      datetime: "03:34",
      message: "How about meeting tomorrow?",
      id: "c",
      numberOfLikes: 23,
    ),
    Post(
      photoUrl:
          "https://theawesomedaily.com/wp-content/uploads/2017/05/images-of-food-porn-4.jpg",
      name: "David",
      datetime: "19:18",
      message: "How about meeting tomorrow?",
      id: "q",
      numberOfLikes: 67,
    ),
    Post(
      photoUrl:
          "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1528394829%2FGenTsoChickenAirFry.jpg%3Fitok%3DFSMg2nSW",
      name: "Laurent",
      datetime: "22:10",
      message: "How about meeting tomorrow?",
      id: "m",
      numberOfLikes: 39,
    ),
  ];
}
