import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';

abstract class IMoviesService {
  Future<List<MoviesModel>> getMovies();
  Future<dynamic> deleteMovie(int movieId);
  Future<dynamic> saveMovie(MoviesModel movie);
  Future<dynamic> editMovie(MoviesModel movie);
}
