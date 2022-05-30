import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/app/utils/storage.utils.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/core/values/globals.dart';
import 'package:cinepolis_admin/data/models/entities/users/user.model.dart';
import 'package:cinepolis_admin/data/models/entities/users/user_detail.model.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:cinepolis_admin/data/services/employees/user.contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final IAuthService _service;
  final IUserService _employeeService;

  var user = User.fromVoid().obs;
  var profile = <UserDetail>[].obs;
  var loading = true.obs;

  var telBranch = ''.obs;
  var streetBranch = ''.obs;

  ProfileController(this._service, this._employeeService);

  @override
  void onInit() async {
    super.onInit();
    await _currentUser();
    loading.value = false;
  }

  _currentUser() async {
    await _service.checkUser().then((value) async {
      user.value = value!;
      await _employeeService
          .getProfile(int.tryParse(user.value.code) ?? 0)
          .then((value) => profile.value = value);
    });
  }

  validationAccess(var id) {
    bool access = false;

    switch (id) {
      case 220: //gerente
        access = true;
        break;
    }

    return access;
  }

  singOut(BuildContext context) {
    MsgUtils.confirm(context, "¿Seguro Quieres Cerrar Sesión?", () {
      Get.offAllNamed(Routes.login);

      LocalStorageUtils.setStringKey(Globals.tokenKey, "");
    }, () {});
  }
}
