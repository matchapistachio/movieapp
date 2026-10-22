import 'package:flutter/foundation.dart';
import 'package:movieapp/models/movie.dart';

class WatchlistService extends ChangeNotifier {
  final List<Movie> _watchlist = [];

  List<Movie> get watchlist => List.unmodifiable(_watchlist);

  bool isInWatchlist(int movieId) {
    return _watchlist.any((m) => m.id == movieId);
  }

  void toggleWatchlist(Movie movie) {
    if (isInWatchlist(movie.id)) {
      _watchlist.removeWhere((m) => m.id == movie.id);
    } else {
      _watchlist.add(movie);
    }
    notifyListeners();
  }

  void addToWatchlist(Movie movie) {
    if (!isInWatchlist(movie.id)) {
      _watchlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWatchlist(int movieId) {
    _watchlist.removeWhere((m) => m.id == movieId);
    notifyListeners();
  }

  void seedInitialMovies(List<Movie> movies) {
    if (_watchlist.isEmpty && movies.isNotEmpty) {
      _watchlist.add(movies.first);
      notifyListeners();
    }
  }
}