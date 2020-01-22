class ItemModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];

    List<_Result> temp = [];

    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get page => _page;

  int get total_pages => _total_pages;

  int get total_results => _total_results;
}

class _Result {
  int _id;
  int _vote_count;
  var _vote_average;
  bool _video;
  String _poster_path;
  bool _adult;
  List<int> _genre_ids = [];
  String _release_date;
  String _overview;

  _Result(result) {
    _id = result['id'];
    _vote_count = result['vote_count'];
    _vote_average = result['vote_average'];
    _video = result['video'];
    _poster_path = result['poster_path'];
    _adult = result['adult'];
    _release_date = result['release_date'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _overview = result['overview'];
  }

  int get id => _id;

  int get vote_count => _vote_count;

  double get vote_average => _vote_average;

  bool get video => _video;

  String get poster_path => _poster_path;

  bool get adult => _adult;

  String get release_date => _release_date;

  String get overview => _overview;
}
