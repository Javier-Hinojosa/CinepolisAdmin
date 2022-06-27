import 'package:cinepolis_admin/app/widgets/custom_container/custom_container.widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomHourPickerContainer extends StatelessWidget {
  TimeOfDay? time = TimeOfDay.now();
  TimeOfDay? picked = TimeOfDay.now();
  final Function(TimeOfDay time) dateValue;
  final String nameLabel;
  late String resultHour;

  CustomHourPickerContainer(
    this.dateValue, {
    this.resultHour="",
    this.nameLabel = "Ingresa Fecha",
  });

  @override
  Widget build(BuildContext context) {
    resultHour=TimeOfDay.fromDateTime(DateTime.parse(resultHour)).format(context);
    return GestureDetector(
      onTap: () async {
        picked = await showTimePicker(
          context: context,
          initialTime: time!,
          
          cancelText: "Cancelar",
          confirmText: "Aceptar",
          helpText: "Ingresa una hora",
        );
        if (picked != null) {
          resultHour = "${picked!.hour} ${picked!.minute}";
          dateValue(picked!);
        } else {
          resultHour = "Ingresa Hora";
        }
      },
      child: CustomContainer(labelText: nameLabel, children: [
        Column(
          children: [
            Text(
              resultHour,
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
