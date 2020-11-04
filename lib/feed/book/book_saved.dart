import 'package:flutter/foundation.dart';
import '../post.dart';
import 'catalog.dart';


class PostSavedModel extends ChangeNotifier {

  BookUnsavedModel _catalog;


  final List<int> _itemIds = [];


  BookUnsavedModel get catalog => _catalog;

  set catalog(BookUnsavedModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Post> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  void add(Post item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Post item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
