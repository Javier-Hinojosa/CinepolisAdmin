import 'package:cinepolis_admin/app/pages/login/login.page.dart';
import 'package:cinepolis_admin/app/pages/main/main.page.dart';
import 'package:cinepolis_admin/app/pages/movies/add/movies.add.controller.dart';
import 'package:cinepolis_admin/app/pages/movies/add/movies.add.page.dart';
import 'package:cinepolis_admin/app/pages/movies/edit/movies.edit.page.dart';
import 'package:cinepolis_admin/app/pages/movies/movies.page.dart';
import 'package:cinepolis_admin/app/pages/profile/profile.page.dart';
import 'package:cinepolis_admin/app/pages/splash/splash.page.dart';
import 'package:cinepolis_admin/core/routes/bindings.dart';
import 'package:cinepolis_admin/data/services/auth/auth.api.service.dart';
import 'package:cinepolis_admin/data/services/employees/user.api.service.dart';
import 'package:cinepolis_admin/data/services/filemanager/file_manager.api.service.dart';
import 'package:cinepolis_admin/data/services/movies/movies.api.service.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final authService = AuthApiService();
  static final employeeService = UserApiService();
  static final fileManagerService = FileManagerApiService();
  static final moviesService = MoviesApiService();

  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding(authService)),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(authService)),
    GetPage(
        name: Routes.main,
        page: () => const MainPage(),
        binding: MainBinding(authService, employeeService)),
    GetPage(
        name: Routes.profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding(authService, employeeService)),
    GetPage(
        name: Routes.movies,
        page: () => const MoviesPage(),
        binding: MoviesBinding(moviesService)),
    GetPage(
        name: Routes.moviesAdd,
        page: () => const MoviesAddPage(),
        binding: MoviesAddBinding(moviesService)),
    GetPage(
        name: Routes.moviesEdit,
        page: () => const MoviesEditPage(),
        binding: MoviesEditBinding(moviesService))
  ];
}
