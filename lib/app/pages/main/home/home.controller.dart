import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/data/models/entities/users/user.model.dart';
import 'package:cinepolis_admin/data/models/entities/users/user_detail.model.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final IAuthService _service;

  var user = User.fromVoid().obs;
  var profile = <UserDetail>[].obs;

  int selectedBranchId = 0;
  var loading = false.obs;
  var summaryLoading = false.obs;

  HomeController(this._service); //agragarlo siemppre con una coma

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    await _init();
    loading.value = false;
  }

  _init() async {
    var existingUser = await _service.checkUser();
    if (existingUser != null) {
      user.value = existingUser;
      //Noticias
    } else {
      Get.offAllNamed(Routes.login);
    }
  }

  changeBranch(int? branch) async {
    if (branch == null) return;
    selectedBranchId = branch;
    summaryLoading.value = true;
    summaryLoading.value = false;
  }

  dateNow() {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    var date = formatter.format(DateTime.now());
    return date;
  }

  goToProfile() {
    Get.toNamed(Routes.profile);
  }
}
