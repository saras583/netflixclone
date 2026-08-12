import 'package:flutter/foundation.dart';
import 'package:netfixclone_app/services/tmdbservies.dart';

import '../models/movie_model.dart';

class SearchViewModel extends ChangeNotifier {
  final Tmdbservies _service = Tmdbservies();

  List<MovieModel> _searchResults = [];

  bool _isLoading = false;

  String? _errorMessage;

  List<MovieModel> get searchResults => _searchResults;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      _searchResults = [];
      _errorMessage = null;

      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {
      _searchResults = await _service.searchMovies(query);

      debugPrint(
        'Search results: ${_searchResults.length}',
      );
    } catch (e) {
      debugPrint('Search error: $e');

      _searchResults = [];
      _errorMessage = 'Failed to search movies';
    }

    _isLoading = false;

    notifyListeners();
  }

  void clearSearch() {
    _searchResults = [];
    _errorMessage = null;

    notifyListeners();
  }
}