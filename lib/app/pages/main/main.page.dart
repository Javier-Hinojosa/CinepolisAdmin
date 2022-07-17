import 'package:cinepolis_admin/app/pages/main/home/home.page.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const ProgressPrimary()
        : Scaffold(
            appBar: AppBar(),
            drawer: CurvedDrawer(
                index: controller.selectedPageIndex.value,
                width: 70,
                color: Colors.black,
                buttonBackgroundColor: Colors.blue[900]!,
                labelColor: Colors.white,
                items: controller.drawerItems,
                onTap: (newIndex) {
                  controller.selectedPageIndex.value = newIndex;
                  controller.searchPage(newIndex, context);
                }),
            body: const HomePage(),
          ));
  }
}
