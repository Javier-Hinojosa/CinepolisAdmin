import 'dart:async';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late final IAuthService _service;
  var nameCorporation = 'Cinepolis Admin'.obs;
  var fadeText = true.obs;

  var duration = const Duration(seconds: 2);

  SplashController(this._service);

  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, fadeOut);
  }

  fadeOut() {
    fadeText.value = false;
    return Timer(duration, fadeIn);
  }

  fadeIn() {
    nameCorporation.value = 'Cargando...';
    fadeText.value = true;
    return Timer(duration, checkLoginUser);//revisa si existe un usuario registrado actualmente en la aplicación, de lo contrario entonces lo envia al Login
  }

  checkLoginUser() async {
    var currentUser = await _service.checkUser();
    if (currentUser != null && currentUser.id != 0) {
      Get.offAllNamed(Routes.main);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
