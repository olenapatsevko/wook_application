import 'package:wook_application/util/dummy_data.dart';
import '../post.dart';

class BookUnsavedModel {
  Post getById(int id) => Post().findById(Data.dummyData, id);

  Post getByPosition(int position) {
    return getById(position);
  }
}
