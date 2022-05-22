import 'package:cinepolis_admin/app/pages/main/home/home.page.dart';
import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.controller.dart';
import 'package:flutter/services.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const ProgressPrimary()
        :Scaffold(
          appBar: SimpleAppBar(
              title: "Bienvenido ${controller.profile.first.nombres}"),
          body: WillPopScope(
              onWillPop: () =>
                  MsgUtils.exit(
                      context,
                      "¿Seguro quieres cerrar la app?",
                          () =>
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop')),
              child: const HomePage()))
    );
  }
}
