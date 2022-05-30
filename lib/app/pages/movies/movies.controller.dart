import 'dart:convert';

import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  final IMoviesService _moviesService;

  var movies = <MoviesModel>[].obs;
  var loading = false.obs;

  MoviesController(this._moviesService);

  @override
  void onInit() async {
    super.onInit();
    getMovies();
  }

  getMovies() async {
    loading.value = true;
    movies.value = await _moviesService.getMovies();
    loading.value = false;
  }

  deleteMovie(idMovie) async {
    await _moviesService.deleteMovie(idMovie).then((value) {
      SnackUtils.success("Pelicula eliminada con exito");
      getMovies();
    }).onError((error, stackTrace) =>
        SnackUtils.error("Ah ocurrido un error al borrar", "Advertencia"));
  }

  editMovie(MoviesModel movieModel) {
    var json = jsonEncode(movieModel);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String ofuscado = stringToBase64.encode(json);
    Get.toNamed("${Routes.moviesEdit}?movie=$ofuscado");
  }

  confirmDelete(int idMovie, BuildContext context) async {
    MsgUtils.confirm(context, "¿Seguro Quieres Eliminarlo?",
        () => deleteMovie(idMovie), () => {});
  }
}
