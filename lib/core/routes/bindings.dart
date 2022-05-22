
import 'package:cinepolis_admin/app/pages/login/login.controller.dart';
import 'package:cinepolis_admin/app/pages/main/home/home.controller.dart';
import 'package:cinepolis_admin/app/pages/main/main.controller.dart';
import 'package:cinepolis_admin/app/pages/splash/splash.controller.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:cinepolis_admin/data/services/employees/user.contract.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  final IAuthService authService;
  SplashBinding(this.authService);
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(authService));
  }
}

class LoginBinding implements Bindings {
  final IAuthService authService;

  LoginBinding(this.authService);

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authService));
  }
}

class MainBinding implements Bindings {
  final IAuthService authService;
  final IUserService employeeService;

  MainBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut(() => MainController(authService, employeeService));
    Get.lazyPut(() => HomeController(authService));


  }
}
