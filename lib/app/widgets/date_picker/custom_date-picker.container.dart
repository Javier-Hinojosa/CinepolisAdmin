import 'package:cinepolis_admin/app/widgets/custom_container/custom_container.widget.dart';
import 'package:cinepolis_admin/core/common/extensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// ignore: must_be_immutable
class CustomDatePickerContainer extends StatelessWidget {
  DateTime? datePickedValue = DateTime.now();
  String date = 'Ingresa fecha';
  final String dateValues;
  final Function(DateTime date) dateValue;
  final int lastDate;
  final int initDate;
  final bool isEnable;
  final String nameLabel;

  CustomDatePickerContainer(this.dateValue,
      {Key? key, this.nameLabel = "Ingresa Fecha",
      this.initDate = -30,
      this.lastDate = 30,
      this.dateValues = "",
      this.isEnable = true,
      }) : super(key: key) {
    date = (DateTime.tryParse(dateValues)??DateTime.now()).formatDate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async =>
           DatePicker.showDatePicker(
          context,
          theme: DatePickerTheme(backgroundColor: Theme.of(context).primaryColorLight),
          currentTime: datePickedValue,
          minTime: DateTime.now().add(Duration(days: initDate)),
          maxTime: DateTime.now().add(Duration(days: lastDate)),
          onChanged: (value){
            datePickedValue=value;
            if (datePickedValue != null) {
              date = datePickedValue.toString().split(' ')[0].trim();
              dateValue(datePickedValue!);
            } else {
              date = DateTime.now().formatDate();
              dateValue(DateTime(0));
            }
          },
               locale: LocaleType.es,
               showTitleActions: true,
          /*titleText: 'Ingresa fecha',
          initialDate: datePickedValue,
          firstDate: DateTime.now().add(Duration(days: initDate)),
          lastDate: DateTime.now().add(Duration(days: lastDate)),
          dateFormat: "yyyy-MM-dd",
          locale: DatePicker.localeFromString("es"),
          backgroundColor: Theme.of(context).primaryColorLight,
          itemTextStyle: Theme.of(context).textTheme.subtitle2!.apply(fontSizeDelta: 2),
          reverse: true,
          cancelText: 'Cancelar',
          confirmText: 'Aceptar',
          textColor: Theme.of(context).highlightColor,*/
          onConfirm: (value){
            datePickedValue=value;
            if (datePickedValue != null) {
              date = datePickedValue.toString().split(' ')[0].trim();
              dateValue(datePickedValue!);
            } else {
              date = DateTime.now().formatDate();
              dateValue(DateTime(0));
            }
          }
        ),
      child: CustomContainer(labelText: nameLabel, children: [
        Column(
          children: [
            Text(
              date,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .apply(fontSizeDelta: 2),
            )
          ],
        )
      ]),
    );
  }
}
