import 'dart:convert';

import 'package:cinepolis_admin/core/values/enviroments.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/models/enums/request_method.enum.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';

import '../base.service.dart';

class MoviesApiService extends BaseService implements IMoviesService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<MoviesModel>> getMovies() async {
    var userJson = await provider.request<MoviesModel>(
        RequestMethod.get, "${_recruitmentUrl}api/cinepolis/movies",
        useDefaultUrl: false);
    return List<MoviesModel>.from(userJson.map((x) => MoviesModel.fromJson(x)));
  }

  @override
  Future<dynamic> deleteMovie(int movieId) async {
    return await provider.request<MoviesModel>(
        RequestMethod.delete, "${_recruitmentUrl}api/cinepolis/movies/$movieId",
        useDefaultUrl: false);
  }

  @override
  Future<dynamic> editMovie(MoviesModel movie) async {
    Map<String, dynamic> movieJson = movie.toJson();
    var bodyMovie = json.encode(movieJson);

    return await provider.request<MoviesModel>(
        RequestMethod.post, "${_recruitmentUrl}api/cinepolis/movies/modify",
        useDefaultUrl: false, body: bodyMovie);
  }

  @override
  Future<dynamic> saveMovie(MoviesModel movie) async {
    Map<String, dynamic> movieJson = movie.toJson();
    var bodyMovie = json.encode(movieJson);

    return await provider.request<MoviesModel>(
        RequestMethod.post, "${_recruitmentUrl}api/cinepolis/movies",
        useDefaultUrl: false, body: bodyMovie);
  }
}
