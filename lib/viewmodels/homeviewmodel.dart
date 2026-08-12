import 'package:flutter/foundation.dart';
import 'package:netfixclone_app/models/movie_model.dart';
import 'package:netfixclone_app/services/tmdbservies.dart';

class Homeviewmodel extends ChangeNotifier{
  
  final Tmdbservies _servies = Tmdbservies();

 

  List<MovieModel> _popularMovie = [];
  List<MovieModel> trendingMovies = [];

  bool _isLoading = false;

  String? _errorMessage;
   List<MovieModel> get popularMovies => _popularMovie;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getPopulorMovies()async{
     
     _isLoading= true;
     _errorMessage = null;
     notifyListeners();

     try{
      _popularMovie = await _servies.getPopularMovies();
     }catch(e){
      _errorMessage = toString();
     }
     _isLoading = false;

     notifyListeners();



  }
  Future<void> getTrendingMovies() async {
  try {
    trendingMovies = await _servies.getTrendingMovies();

    notifyListeners();
  } catch (e) {
    debugPrint('Trending ViewModel error: $e');
  }
}
  



}