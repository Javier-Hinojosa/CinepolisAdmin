import 'package:cinepolis_admin/app/pages/movies/movies.controller.dart';
import 'package:cinepolis_admin/app/pages/movies/widget/news_item.widget.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: "Peliculas",
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: ProgressPrimary())
            : ListView(
                children: <Widget>[
                  _listNewsWidget(context).paddingOnly(bottom: 30),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          hoverColor: Colors.blue[400],
          onPressed: () => Get.toNamed(Routes.moviesAdd),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _listNewsWidget(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.movies.length,
        clipBehavior: Clip.antiAlias,
        itemBuilder: (_, i) {
          return NewsItem(
              controller.movies[i],
              () => controller.confirmDelete(controller.movies[i].id!, context),
              () => controller.editMovie(controller.movies[i]));
        });
  }
}
