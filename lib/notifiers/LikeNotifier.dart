import 'package:flutter/cupertino.dart';
import 'package:wook_application/entity/like.dart';

class LikeNotifier extends ChangeNotifier{

  LikeNotifier();

  Like _like;
   void addLike(Like like){

     notifyListeners();
   }

}