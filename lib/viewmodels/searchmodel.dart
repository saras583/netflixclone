import 'package:flutter/foundation.dart';
import 'package:netfixclone_app/models/movie_model.dart';
import 'package:netfixclone_app/services/tmdbservies.dart';

class Searchmodel extends ChangeNotifier{

  final Tmdbservies tmdbservies = Tmdbservies();

  List<MovieModel> searchResult = [];

 bool isloadind = false;
 
 String? errorMessage;


 Future<void> searchMovie(String query)async{
  if(query.trim().isEmpty){
    searchResult = [];
    notifyListeners();
    return;
  }
  try{
    isloadind = true;
    errorMessage = null;
    notifyListeners();

    searchResult = await tmdbservies.searchMovies(query.trim(),);
  }catch(e){
    errorMessage = 'somthing is wrong';
    notifyListeners();
  }
 }
}