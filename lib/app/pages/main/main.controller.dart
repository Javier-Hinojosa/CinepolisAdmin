import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/app/utils/sign_out.utils.dart';
import 'package:cinepolis_admin/app/utils/storage.utils.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/core/values/enviroments.dart';
import 'package:cinepolis_admin/core/values/globals.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late final IAuthService _service;

  static const String imagesUrl = Environments.imageUrl;

  var loading = true.obs;
  var selectedPageIndex = 0.obs;

  final List<DrawerItem> drawerItems = <DrawerItem>[
    const DrawerItem(icon: Icon(Icons.home_outlined), label: "Inicio"),
    const DrawerItem(icon: Icon(Icons.movie_creation_outlined), label: "Peliculas"),
    const DrawerItem(icon:Icon(Icons.store),label: "Asignación"),
    const DrawerItem(icon: Icon(Icons.production_quantity_limits_outlined), label: "Productos"),
    const DrawerItem(icon: Icon(Icons.exit_to_app_rounded), label: "Cerrar Sesión")
  ];

  MainController(this._service);

  @override
  void onInit() async {
    super.onInit();
    await _service.checkUser().then((existingUser) async {//trae los datos del usuario guardado actualmente, si es que no los conoce, lo regresa al Login en donde podra iniciar sesión.
      loading.value = false;
    }).onError((error, stackTrace) async {
      SignOut();
      return SnackUtils.error(error.toString(), "Error");
    });
  }

  _onSingOut(BuildContext context) {
    MsgUtils.confirm(context, "¿Seguro Quieres Cerrar Sesión?", () {
      Get.offAllNamed(Routes.login);

      LocalStorageUtils.setStringKey(Globals.tokenKey, "");
    }, () {});
  }

  searchPage(int value, BuildContext context) {
    switch (value) {
      case 0:
        Get.back();
        break;
      case 1:
        Get.toNamed(Routes.movies);
        break;
      case 2:
        Get.toNamed(Routes.assignment);
        break;
      case 3:
        Get.toNamed(Routes.movies);
        break;
      case 4:
        _onSingOut(context);
        break;
    }
  }
}
