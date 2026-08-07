import 'package:dio/dio.dart';
import 'package:netfixclone_app/core/constants/apiconstant.dart';
import 'package:netfixclone_app/models/movie_model.dart';

class Tmdbservies {


  final Dio dio = Dio(BaseOptions(
    baseUrl: Apiconstant.baseUrl
  ));

  
  Future<List<MovieModel>> getPopularMovies()async{
    try{
      

     final response = await dio.get(
      Apiconstant.popularMovie,
      queryParameters:{
        'api_key':Apiconstant.apiKey,
        'language': 'en-Us',
        'page':1,
      } 
     );

     final List results = response.data['results'];

     return results.map((movie)=> MovieModel.fromJson(movie)).toList();


  
    }catch(e){
      print('api error $e');
      rethrow;
    }
  }
}