import 'package:netfixclone_app/services/tmdbservies.dart';

Future<void> testApi()async{


   final service = Tmdbservies();

   final movies = await service.getPopularMovies();

   for(final movie in movies ){

    print(movie.title);
    
   }

}