import 'package:cinepolis_admin/app/pages/assigment_branch/assigment_branch.controller.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:cinepolis_admin/app/widgets/custom_container/custom_container.widget.dart';
import 'package:cinepolis_admin/app/widgets/custom_dropdown.widget/Dropdown_custom.widget.dart';
import 'package:cinepolis_admin/app/widgets/date_picker/custom_date-picker.container.dart';
import 'package:cinepolis_admin/app/widgets/hour_picker/custom_hour-picker.container.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AssignmentHorario extends GetView<AssignmentBranchController>{

  final bool isAdd;
  final int id;

  const AssignmentHorario({this.isAdd=true,this.id=0,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Agregar/Editar Horario"),
      body:  Obx(
            () => controller.loading.value
            ? const Center(child: ProgressPrimary())
            : ReactiveForm(
          formGroup: controller.formAssets,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dropDown(
                            "Sucursal",
                                (b) => controller.changeBranch(b),
                            controller.selectBranchId.value,
                            controller.branches
                                .map((i) => DropdownMenuItem(
                              value: i.id,
                              child: Text('${i.nombre}'),
                            ))
                                .toList()),
                        Visibility(
                          visible: controller.selectSalaId.value!=0,
                          child: _dropDown(
                            "Sala",
                                  (b) => controller.changeSala(b),
                              controller.selectSalaId.value,
                              controller.salas
                                  .map((i) => DropdownMenuItem(
                                value: i.id,
                                child: Text('sala ${i.sala}'),
                              ))
                                  .toList()),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: CustomContainer(labelText: "¿Es en Español?", children: [
                      Switch(value: controller.isSpanish.value, onChanged: (val)=>controller.isSpanish.value=val)
                    ]),
                  )
                ],
              ).paddingAll(10),
              _dropDown(
                  "Pelicula",
                      (b) => controller.changeMovie(b),
                  controller.selectMovieId.value,
                  controller.movies
                      .map((i) => DropdownMenuItem(
                    value: i.id,
                    child: Text('${i.nombre}'),
                  ))
                      .toList()),
              dateAndHour(context),
              Visibility(
                visible: isAdd,
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 500,
                      child: CustomButtonLarge(
                        text: "Editar",
                        color: Colors.blue[900]!,
                        onPressed: () => controller.onEdit(id),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 500,
                      child: CustomButtonLarge(
                        text: "Eliminar",
                        color: Colors.red[400]!,
                        onPressed: () => controller.onDeleteh(id),
                      ),
                    ),
                  ],
                ),
                child: CustomButtonLarge(
                  text: "Guardar",
                  color: Colors.blue[900]!,
                  onPressed: () => controller.confirmSave(context),
                )
              ).paddingOnly(
                  top: 20,
                  left: MediaQuery.of(context).size.width * 0.40,
                  right: MediaQuery.of(context).size.width * 0.40)
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDown(String label, Function(int i) change, int selected,
      List<DropdownMenuItem<int>>? listDynamic) {
    return CustomDropDown(
      text: label,
        onchange: (i) => change(i!),
        selectedId: selected,
        listDynamic: listDynamic);
  }

  Widget dateAndHour(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CustomDatePickerContainer(
                (date) => controller.onDateChange(date),
            initDate: 0,
            lastDate: 365,
            nameLabel: "¿Fecha?",
            dateValues: controller.insertDate.value.toString(),
          ).paddingOnly(top: 15, left: 15, right: 4),
        ),
        Flexible(
          child: CustomHourPickerContainer(
                (date) => controller.onHourChange(date, context),
            nameLabel: "¿Hora?",
            resultHour: controller.insertDate.value.toString(),
          ).paddingOnly(top: 15, left: 4, right: 15),
        ),
      ],
    );
  }
}