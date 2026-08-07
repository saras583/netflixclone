import 'package:flutter/foundation.dart';
import 'package:netfixclone_app/models/movie_model.dart';
import 'package:netfixclone_app/services/tmdbservies.dart';

class Homeviewmodel extends ChangeNotifier{
  
  final Tmdbservies service;

  Homeviewmodel(this.service);

  List<MovieModel> popularMovie = [];

  bool isloading = false;

  String? errorMessage;

  Future<void> fetchPopulorMovies()async{
     
     isloading= true;
     errorMessage = null;
     notifyListeners();

     try{
      popularMovie = await service.getPopularMovies();
     }catch(e){
      errorMessage = null;
     }
     isloading = false;

     notifyListeners();



  }



}