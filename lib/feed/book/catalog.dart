import 'package:wook_application/util/dummy_data.dart';
import '../post.dart';

class BookUnsavedModel {
  Post getById(int id) => Post().findById(Data.dummyData, id);

  /// Get item by its position in the catalog.
  Post getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}
