import 'package:dio/dio.dart';
import 'package:netfixclone_app/core/constants/apiconstant.dart';
import 'package:netfixclone_app/models/movie_model.dart';

class Tmdbservies {


  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl
  ));

  
  Future<List<MovieModel>> getPopularMovies()async{
    try{
      

     final response = await dio.get(
      ApiConstant.popularMovie,
      queryParameters:{
        'api_key':ApiConstant.apiKey,
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

  Future<List<MovieModel>> searchMovies(String query)async{
    try{
      final response = await dio.get(
        ApiConstant.searchMovie,
        queryParameters: {
           'api_key': ApiConstant.apiKey,
        'query': query,
        'language': 'en-US',
        'page': 1,
        }
      );

      final List results = response.data['results'];
      return results.map((movie)=> MovieModel.fromJson(movie)).toList();
    }catch(e){
      print("$e");
      rethrow;
    }
  }
}