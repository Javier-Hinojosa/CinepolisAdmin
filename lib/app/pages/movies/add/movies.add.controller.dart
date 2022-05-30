import 'package:cinepolis_admin/app/pages/movies/movies.controller.dart';
import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MoviesAddController extends GetxController {
  final IMoviesService _moviesService;

  var loading = false.obs;

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

  MoviesAddController(this._moviesService);

  save() async {
    if (formMovie.value.valid) {
      loading.value = true;

      var model = MoviesModel(
          id: 1,
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

      _moviesService.saveMovie(model).then((value) {
        Get.back(result: Get.find<MoviesController>().getMovies());
        SnackUtils.success("Guardado con Exito");
        loading.value = false;
      }).onError((error, stackTrace) {
        loading.value = false;
        SnackUtils.error("Sucedio un error al guardar", "Advertencia");
      });
    } else {
      SnackUtils.error("Llena todos los campos para guardar", "Advertencia");
    }
  }

  confirmSave(BuildContext context) async {
    MsgUtils.confirm(
        context, "¿Seguro Quieres Agregarlo?", () => save(), () => {});
  }
}
