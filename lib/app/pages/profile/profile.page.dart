import 'package:cinepolis_admin/app/pages/profile/profile.controller.dart';
import 'package:cinepolis_admin/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:cinepolis_admin/app/widgets/progress/progress.widget.dart';
import 'package:cinepolis_admin/core/values/enviroments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const Center(child: ProgressPrimary())
        : Scaffold(
            appBar: SimpleAppBar(
                title: "Mi Perfil", actions: [_buttonExit(context)]),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                _headerProfile(context),
                _imageSheet() // top: MediaQuery.of(context).size.height <= 685 ? 40 : 90)
              ],
            )));
  }

  _headerProfile(BuildContext context) {
    return Card(
      color: Colors.white12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contentEmployee(context),
          Divider(
                  height: 10,
                  color: Theme.of(context).primaryColorLight,
                  indent: 30,
                  endIndent: 30,
                  thickness: 2)
              .paddingOnly(bottom: 5, top: 5),
          _contentJob(context),
        ],
      ),
    );
  }

  _contentJob(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _textPainRow(context, "Departamento: ",
                controller.profile.first.departamento)
            .paddingOnly(bottom: 8),
        _textPainRow(context, "Área: ", controller.profile.first.area)
            .paddingOnly(bottom: 8),
        _textPainRow(context, "División: ", controller.profile.first.division)
            .paddingOnly(bottom: 8),
        _textPainRow(context, "Puesto: ", controller.profile.first.puesto)
            .paddingOnly(bottom: 8),
      ],
    ).paddingOnly(left: 30, bottom: 10);
  }

  _contentEmployee(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _imageContain(context).paddingOnly(right: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textPain(context, controller.profile.first.nombreCompleto)
                  .paddingOnly(bottom: 8),
              _textPain(context, "No° " + controller.profile.first.noEmpleado)
                  .paddingOnly(bottom: 8),
              _textPain(
                      context,
                      controller.profile.first.telefono != 0
                          ? "Tel. " +
                              controller.profile.first.telefono.toString()
                          : 'Sin Teléfono')
                  .paddingOnly(bottom: 8),
              _textPain(context, controller.profile.first.correoE)
            ],
          ).paddingOnly(top: 15, bottom: 15, left: 15),
        ),
      ],
    );
  }

  Widget _imageContain(BuildContext context) {
    return Container(
        width: context.isLargeTablet ? 90 : 85,
        height: context.isLargeTablet ? 90 : 85,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(fit: BoxFit.scaleDown, image: _getImage())));
  }

  ImageProvider<Object> _getImage() {
    ImageProvider _imageDefault =
        const AssetImage('assets/images/user_default.jpg');
    var found = false;

    var _imageNetwork = NetworkImage(
        '${Environments.imageUrl}${controller.user.value.id != 0 ? controller.user.value.picture : 'profile.jpg'}');

    _imageNetwork.evict().then<void>((bool success) {
      if (success) {
        found = true;
      }
    });

    return found ? _imageNetwork : _imageDefault;
  }

  Widget _textPain(BuildContext context, String text) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      maxLines: 2,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyText1!.apply(fontSizeDelta: 1),
      textAlign: TextAlign.start,
    );
  }

  Widget _textPainRow(BuildContext context, String title, String text) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.fade,
          maxLines: 2,
          softWrap: true,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start,
        ),
        Text(
          text,
          overflow: TextOverflow.fade,
          maxLines: 2,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyText2!.apply(fontSizeDelta: 2),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _textPainColumn(BuildContext context, String title, String text,
      CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          overflow: TextOverflow.fade,
          maxLines: 2,
          softWrap: true,
          style:
              Theme.of(context).textTheme.subtitle1!.apply(fontSizeDelta: -2.5),
          textAlign: TextAlign.start,
        ),
        Text(
          text,
          textAlign: TextAlign.end,
          softWrap: true,
          maxLines: 5,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget _buttonExit(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.logout, size: 35),
        tooltip: "Cerrar Sesión",
        onPressed: () => controller.singOut(context));
  }

  Widget _cardBranch(BuildContext context) {
    return Card(
      color: Colors.white12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _containerData(context).paddingOnly(left: 15, bottom: 15, top: 10)
          ],
        ).paddingOnly(top: 5, bottom: 5),
      ),
    );
  }

  Widget _containerData(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 1,
            child: _textPainColumn(context, "Tel. Sucursal:",
                controller.telBranch.value, CrossAxisAlignment.start)),
        Flexible(
          flex: 2,
          child: _textPainColumn(context, "Dirección:",
              controller.streetBranch.value, CrossAxisAlignment.end),
        ),
      ],
    );
  }

  Widget _imageSheet() {
    return Image.asset(
      "assets/images/cinta_esperanza.png",
      height: 50,
      fit: BoxFit.cover,
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final GestureTapCallback onTap;

  const ProfileCard(this.name, this.icon, this.onTap, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Card(
              color: Theme.of(context).primaryColorLight,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                child: Icon(icon, color: Colors.grey[300]),
              ),
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ).paddingOnly(top: 10)
        ],
      ).paddingAll(10),
    );
  }
}
