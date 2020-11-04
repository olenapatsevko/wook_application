import 'package:flutter/foundation.dart';
import '../post.dart';
import 'catalog.dart';


class PostSavedModel extends ChangeNotifier {
  /// The private field backing [catalog].
  BookUnsavedModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  BookUnsavedModel get catalog => _catalog;

  set catalog(BookUnsavedModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
    'The catalog $newCatalog does not have one of $_itemIds in it.');
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  List<Post> get items => _itemIds.map((id) => _catalog.getById(id)).toList();


  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Post item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Post item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
