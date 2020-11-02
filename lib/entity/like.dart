
class Like{
  String _id;
  String _author;
  String _owner;
  DateTime _time;

  Like(this._id, this._author, this._owner, this._time);

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  String get owner => _owner;

  set owner(String value) {
    _owner = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}