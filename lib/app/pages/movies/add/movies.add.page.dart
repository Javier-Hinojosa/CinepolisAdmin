import 'package:cinepolis_admin/app/pages/movies/add/movies.add.controller.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MoviesAddPage extends GetView<MoviesAddController> {
  const MoviesAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Agregar Pelicula",
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: ProgressPrimary())
            : ReactiveForm(
                formGroup: controller.formMovie.value,
                child: ListView(
                  children: <Widget>[
                    formulario(context),
                    CustomButtonLarge(
                      text: "Guardar",
                      color: Colors.blue[900]!,
                      onPressed: () => controller.confirmSave(context),
                    ).paddingOnly(
                        top: 20,
                        left: MediaQuery.of(context).size.width * 0.40,
                        right: MediaQuery.of(context).size.width * 0.40)
                  ],
                ),
              ),
      ),
    );
  }

  Widget formulario(BuildContext context) {
    return Column(
      children: [
        textForm("Nombre de Película", 'nombre', "Ingresa un Nombre", context)
            .paddingOnly(
                top: 10,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15),
        Row(
          children: [
            Expanded(
              child: textForm("Categoria de Película", 'categoria',
                      "Ingresa una Categoria", context)
                  .paddingOnly(
                      left: MediaQuery.of(context).size.width * 0.15, right: 5),
            ),
            Expanded(
              child: textForm(
                      "Duración", 'duracion', "Ingresa una Duración", context)
                  .paddingOnly(
                      left: 5, right: MediaQuery.of(context).size.width * 0.15),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: textForm("Trailer de Película", 'trailer',
                      "Ingresa un Trailer", context)
                  .paddingOnly(
                      left: MediaQuery.of(context).size.width * 0.15, right: 5),
            ),
            Expanded(
              child: textForm(
                      "Costo de Película", 'costo', "Ingresa un Costo", context)
                  .paddingOnly(
                      left: 5, right: MediaQuery.of(context).size.width * 0.15),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: textForm(
                      "Foto de Película", 'foto', "Ingresa una Foto", context)
                  .paddingOnly(
                      left: MediaQuery.of(context).size.width * 0.15, right: 5),
            ),
            Expanded(
              child: textForm(
                      "Sinópsis", 'sinopsis', "Ingresa una Sinópsis", context)
                  .paddingOnly(
                      left: 5, right: MediaQuery.of(context).size.width * 0.15),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: textForm("Clasificación de Película", 'clasificacion',
                      "Ingresa una clasificacion", context)
                  .paddingOnly(
                      left: MediaQuery.of(context).size.width * 0.15, right: 5),
            ),
            Expanded(
              child: textForm("Actores", 'actores', "Ingresa Actores", context)
                  .paddingOnly(
                      left: 5, right: MediaQuery.of(context).size.width * 0.15),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: textForm("Directores de Película", 'directores',
                      "Ingresa Directores", context)
                  .paddingOnly(
                      left: MediaQuery.of(context).size.width * 0.15, right: 5),
            ),
            Expanded(
              child: textForm(
                      "Es Estreno", 'estreno', "Ingresa si es Estreno", context)
                  .paddingOnly(
                      left: 5, right: MediaQuery.of(context).size.width * 0.15),
            ),
          ],
        )
      ],
    );
  }

  Widget textForm(
      String label, String formControl, String msgError, BuildContext context) {
    return ReactiveTextField(
      formControlName: formControl,
      validationMessages: (control) => {'required': msgError},
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[900]!, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          errorStyle: const TextStyle(fontSize: 12),
          labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
          labelText: label),
    ).paddingOnly(bottom: 10);
  }
}
