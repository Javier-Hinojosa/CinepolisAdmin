import 'package:cinepolis_admin/app/pages/assigment_branch/assigment_branch.controller.dart';
import 'package:cinepolis_admin/app/pages/assigment_branch/widgets/assignment_horario.page.dart';
import 'package:cinepolis_admin/app/pages/assigment_branch/widgets/assignment_horario.item.widget.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentBranchPage extends GetView<AssignmentBranchController>{
  const AssignmentBranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Horarios"),
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
          onPressed: () => Get.to(()=>const AssignmentHorario()),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }


  Widget _listNewsWidget(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        children: ListTile.divideTiles(context: context,color: Colors.grey,tiles: controller.horarios.map((element) => AssignmentHorarioItem(element, ()=>controller.onRouteEdit(element)))).toList(),
        );
  }



}