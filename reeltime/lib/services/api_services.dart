import 'dart:convert';
import 'dart:developer';

import 'package:reeltime/common/utils.dart';
import 'package:reeltime/models/detail_model.dart';
import 'package:reeltime/models/genre_movie_model.dart';
import 'package:reeltime/models/movie_cast_model.dart';
import 'package:reeltime/models/search_model.dart';
import 'package:reeltime/models/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:reeltime/models/video_model.dart';

class ApiService{

  
String key = "?api_key=$apiKey";
String? endPoint;
String include = "&include_adult=false&sort_by=popularity.desc";


Future<MovieModel> getNowPlaying()async{
  endPoint = "movie/now_playing";
  final url = "$baseUrl$endPoint$key$include";

  var response = await http.get(Uri.parse(url));
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return MovieModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }


}


Future<MovieModel> getUpcomingMovies()async{
  endPoint = "movie/upcoming";
  final url = "$baseUrl$endPoint$key$include";

  var response = await http.get(Uri.parse(url));
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return MovieModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }


}

Future<MovieByGenreModel> getMoviesByGenre(int genre)async{
  // https://api.themoviedb.org/3/discover/movie?api_key=f28b55e3b3a47ba32dbe2e95e70d787c&with_genres=16
  endPoint = "discover/movie";
  final url = "$baseUrl$endPoint$key&with_genres=$genre$include";

  var response = await http.get(
    Uri.parse(url),
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return MovieByGenreModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}




Future<VideoModel> getMovieTrailer(int movieId)async{
  // https://api.themoviedb.org/3/discover/movie?api_key=f28b55e3b3a47ba32dbe2e95e70d787c&with_genres=16
  endPoint = "movie/$movieId/videos";
  final url = "$baseUrl$endPoint$key$include";

  var response = await http.get(
    Uri.parse(url),
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return VideoModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}






Future<SearchModel> getSearchedMovie(String query)async{

  endPoint = "search/movie?query=$query$include";
  final url = "$baseUrl$endPoint";
  print(url);

  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjhiNTVlM2IzYTQ3YmEzMmRiZTJlOTVlNzBkNzg3YyIsIm5iZiI6MTcyMzY4MzkzMy44MzQ4MDksInN1YiI6IjY2YjljOWQ0ZjY4MTViNTBhZWQ1YmIxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a-0BAdUdu3k27RemJkZM4Yoo_p69l6voxznz0kSm2hI"
    }
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return SearchModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}






Future<MovieDetailModel> getMovieDetail(int movieId)async{

  endPoint = "movie/";
  final url = "$baseUrl$endPoint$movieId";
  print(url);

  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjhiNTVlM2IzYTQ3YmEzMmRiZTJlOTVlNzBkNzg3YyIsIm5iZiI6MTcyMzY4MzkzMy44MzQ4MDksInN1YiI6IjY2YjljOWQ0ZjY4MTViNTBhZWQ1YmIxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a-0BAdUdu3k27RemJkZM4Yoo_p69l6voxznz0kSm2hI"
    }
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return MovieDetailModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}




Future<SearchModel> getSimilarMovies(int movieId)async{

  endPoint = "movie/$movieId/similar";
  final url = "$baseUrl$endPoint";
  print(url);

  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjhiNTVlM2IzYTQ3YmEzMmRiZTJlOTVlNzBkNzg3YyIsIm5iZiI6MTcyMzY4MzkzMy44MzQ4MDksInN1YiI6IjY2YjljOWQ0ZjY4MTViNTBhZWQ1YmIxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a-0BAdUdu3k27RemJkZM4Yoo_p69l6voxznz0kSm2hI"
    }
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    SearchModel searchModel = SearchModel.fromJson(data);

    searchModel.results = searchModel.results.map((movie) {
      movie.adult = false;
      return movie;
    }).toList();
    searchModel.results.sort( (a, b) => b.popularity.compareTo(a.popularity), );


    return SearchModel.fromJson(data).copyWith(results: searchModel.results);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}




Future<MovieCastModel> getMovieCast(int movieId)async{

  endPoint = "movie/$movieId/credits";
  
  final url = "$baseUrl$endPoint";
  print(url);

  var response = await http.get(
    Uri.parse(url),
    headers: {
      "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjhiNTVlM2IzYTQ3YmEzMmRiZTJlOTVlNzBkNzg3YyIsIm5iZiI6MTcyMzY4MzkzMy44MzQ4MDksInN1YiI6IjY2YjljOWQ0ZjY4MTViNTBhZWQ1YmIxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a-0BAdUdu3k27RemJkZM4Yoo_p69l6voxznz0kSm2hI"
    }
  );
  
  if (response.statusCode ==200) {
    log("Success");
    Map<String, dynamic> data = jsonDecode(response.body);
    return MovieCastModel.fromJson(data);
  }
  else{
    throw Exception("Failed to load upcoming movies");

  }
}




}