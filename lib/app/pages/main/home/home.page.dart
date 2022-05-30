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
        : SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/cinepolis.png"),
                Align(
                  alignment: Alignment.center,
                  child: title(
                      "Bienvenido al Sistema de Administración de Cinépolis"),
                ).paddingOnly(top: 15),
                Card(
                        color: Colors.blue[900]!,
                        child: Column(
                          children: [
                            subtitle(
                                    "En este sistema podras realizar diferentes funciones,")
                                .paddingOnly(top: 5),
                            subtitle(
                                    "entre ellas podras hacer un crud completo para los sistemas, ")
                                .paddingOnly(top: 5),
                            subtitle(
                                    "que este consumiento nuestra BASE DE DATOS.")
                                .paddingOnly(top: 5, bottom: 5),
                          ],
                        ).paddingOnly(left: 10, right: 10))
                    .paddingOnly(top: 15)
              ],
            ).paddingOnly(top: 100),
          ));
  }

  Widget title(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
    );
  }

  Widget subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
