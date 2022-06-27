import 'package:cinepolis_admin/core/common/extensors.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_branch.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignmentHorarioItem extends StatelessWidget{

  final AssignmentScheduleModel element;
  final GestureTapCallback onEdit;
  const AssignmentHorarioItem(this.element,this.onEdit, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[500],
      child: ListTile(title: Text(DateTime.parse(element.inicia!).formatDateHour()),
        leading: Icon(Icons.hourglass_bottom, color: Theme.of(context).primaryColor),
        onTap: onEdit,
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pelicula: "+element.pelicula!.nombre!),
            Text(element.isEspanish!?"Español":"Inglés"),
            Text("Sala: "+element.sala!.sala.toString()),
            Text("Sucursal: "+element.sala!.idSucursal.toString()),
          ],
        ).paddingAll(10),

      ),
    );
  }




}