import 'package:cinepolis_admin/app/pages/assigment_branch/assigment_branch.page.dart';
import 'package:cinepolis_admin/app/pages/login/login.page.dart';
import 'package:cinepolis_admin/app/pages/main/main.page.dart';
import 'package:cinepolis_admin/app/pages/movies/add/movies.add.page.dart';
import 'package:cinepolis_admin/app/pages/movies/edit/movies.edit.page.dart';
import 'package:cinepolis_admin/app/pages/movies/movies.page.dart';
import 'package:cinepolis_admin/app/pages/splash/splash.page.dart';
import 'package:cinepolis_admin/core/routes/bindings.dart';
import 'package:cinepolis_admin/data/services/auth/auth.api.service.dart';
import 'package:cinepolis_admin/data/services/movies/movies.api.service.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class Pages {//enlazan el o los controladores que seran usadore en la page, se le es nombrada y se pone la page con la que va a iniciar al llamar a esa ruta
  static final authService = AuthApiService();
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
        binding: MainBinding(authService)),
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
        binding: MoviesEditBinding(moviesService)),
    GetPage(
        name: Routes.assignment,
        page: () => const AssignmentBranchPage(),
        binding: AssignmentBinding(moviesService))
  ];
}
