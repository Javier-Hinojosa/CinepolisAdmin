
import 'package:cinepolis_admin/app/pages/main/home/home.controller.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const ProgressPrimary()
        : Column(children: [

    ],));
  }
}
