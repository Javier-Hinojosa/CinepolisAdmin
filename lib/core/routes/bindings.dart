import 'package:cinepolis_admin/app/pages/login/login.controller.dart';
import 'package:cinepolis_admin/app/pages/main/home/home.controller.dart';
import 'package:cinepolis_admin/app/pages/main/main.controller.dart';
import 'package:cinepolis_admin/app/pages/movies/add/movies.add.controller.dart';
import 'package:cinepolis_admin/app/pages/movies/edit/movies.edit.controller.dart';
import 'package:cinepolis_admin/app/pages/movies/movies.controller.dart';
import 'package:cinepolis_admin/app/pages/profile/profile.controller.dart';
import 'package:cinepolis_admin/app/pages/splash/splash.controller.dart';
import 'package:cinepolis_admin/data/services/auth/auth.contract.dart';
import 'package:cinepolis_admin/data/services/employees/user.contract.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';
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

class ProfileBinding implements Bindings {
  final IAuthService authService;
  final IUserService employeeService;

  ProfileBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(authService, employeeService));
  }
}

class MoviesBinding implements Bindings {
  final IMoviesService moviesService;

  MoviesBinding(this.moviesService);

  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(() => MoviesController(moviesService));
  }
}

class MoviesAddBinding implements Bindings {
  final IMoviesService moviesService;

  MoviesAddBinding(this.moviesService);

  @override
  void dependencies() {
    Get.lazyPut<MoviesAddController>(() => MoviesAddController(moviesService));
  }
}

class MoviesEditBinding implements Bindings {
  final IMoviesService moviesService;

  MoviesEditBinding(this.moviesService);

  @override
  void dependencies() {
    Get.lazyPut<MoviesEditController>(
        () => MoviesEditController(moviesService));
  }
}
