import 'dart:convert';

import 'package:cinepolis_admin/app/pages/movies/movies.controller.dart';
import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MoviesEditController extends GetxController {
  final IMoviesService _moviesService;

  var loading = false.obs;
  var movie = MoviesModel.fromVoid().obs;

  var formMovie = FormGroup({
    'nombre': FormControl<String>(validators: [Validators.required], value: ''),
    'categoria':
        FormControl<String>(validators: [Validators.required], value: ''),
    'duracion':
        FormControl<String>(validators: [Validators.required], value: ''),
    'trailer':
        FormControl<String>(validators: [Validators.required], value: ''),
    'costo': FormControl<String>(validators: [Validators.required], value: ''),
    'foto': FormControl<String>(validators: [Validators.required], value: ''),
    'sinopsis':
        FormControl<String>(validators: [Validators.required], value: ''),
    'clasificacion':
        FormControl<String>(validators: [Validators.required], value: ''),
    'actores':
        FormControl<String>(validators: [Validators.required], value: ''),
    'directores':
        FormControl<String>(validators: [Validators.required], value: ''),
    'estreno':
        FormControl<String>(validators: [Validators.required], value: ''),
  }).obs;

  MoviesEditController(this._moviesService);

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    // VARIABLE base64
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    //Recibimos base 64
    var dataRecib = Get.parameters.values.first!;

    //Desofuscamos la cadena
    var desofuscado = stringToBase64.decode(dataRecib);

    // Mapeamos el json final
    Map<String, dynamic> valueMap = json.decode(desofuscado);
    movie.value = MoviesModel.fromJson(valueMap);
    llenarDatos();
    loading.value = false;
  }

  llenarDatos() {
    formMovie.value.control('nombre').value = movie.value.nombre;
    formMovie.value.control('categoria').value = movie.value.categorias;
    formMovie.value.control('duracion').value = movie.value.duracion.toString();
    formMovie.value.control('trailer').value = movie.value.traierUrl;
    formMovie.value.control('costo').value = movie.value.costo.toString();
    formMovie.value.control('foto').value = movie.value.photo;
    formMovie.value.control('sinopsis').value = movie.value.sinopsis;
    formMovie.value.control('clasificacion').value = movie.value.clasificacion;
    formMovie.value.control('actores').value = movie.value.actores;
    formMovie.value.control('directores').value = movie.value.directores;
    formMovie.value.control('estreno').value = movie.value.isEstreno.toString();
  }

  edit() async {
    if (formMovie.value.valid) {
      loading.value = true;

      var model = MoviesModel(
          id: movie.value.id,
          nombre: formMovie.value.control('nombre').value,
          categorias: formMovie.value.control('categoria').value,
          duracion: int.tryParse(formMovie.value.control('duracion').value),
          traierUrl: formMovie.value.control('trailer').value,
          costo: double.tryParse(formMovie.value.control('costo').value),
          photo: formMovie.value.control('foto').value,
          sinopsis: formMovie.value.control('sinopsis').value,
          clasificacion: formMovie.value.control('clasificacion').value,
          actores: formMovie.value.control('actores').value,
          directores: formMovie.value.control('directores').value,
          isEstreno: formMovie.value.control('estreno').value);

      _moviesService.editMovie(model).then((value) {
        Get.back(result: Get.find<MoviesController>().getMovies());
        SnackUtils.success("Editado con Exito");
        loading.value = false;
      }).onError((error, stackTrace) {
        loading.value = false;
        SnackUtils.error("Sucedio un error al editar", "Advertencia");
      });
    } else {
      SnackUtils.error("Llena todos los campos para guardar", "Advertencia");
    }
  }

  confirmEdit(BuildContext context) async {
    MsgUtils.confirm(
        context, "¿Seguro Quieres Editarlo?", () => edit(), () => {});
  }
}
