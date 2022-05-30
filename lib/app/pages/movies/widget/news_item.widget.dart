import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsItem extends StatelessWidget {
  final MoviesModel model;
  final Function funtionDelete, funtionEdit;

  const NewsItem(this.model, this.funtionDelete, this.funtionEdit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      elevation: 2.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        hoverColor: Colors.transparent,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _imageContain(context, model.photo!),
            _title(context, model.nombre!).paddingOnly(top: 10),
            _subtitle(context, "Clasificación: ${model.clasificacion!}")
                .paddingOnly(top: 8),
            _subtitle(context, "Duración: ${model.duracion!} min")
                .paddingOnly(top: 3),
            Align(
              alignment: Alignment.bottomCenter,
              child: model.isEstreno!
                  ? _subtitle(context, "Estreno",
                      color: Colors.amber, size: 2.5)
                  : Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => funtionEdit(),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.amber[400],
                    ),
                    tooltip: "Editar"),
                IconButton(
                    onPressed: () => funtionDelete(),
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red[400],
                    ),
                    tooltip: "Eliminar"),
              ],
            )
          ],
        ).paddingOnly(top: 10, bottom: 10),
      ),
    ).paddingOnly(left: 30, right: 30);
  }

  Widget _title(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.subtitle1,
      overflow: TextOverflow.visible,
      maxLines: 3,
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _subtitle(BuildContext context, String text,
      {Color color = Colors.white, double size = 0}) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .apply(color: color, fontSizeDelta: size),
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  Widget _imageContain(BuildContext context, String url) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.network(url, width: 80, height: 80, fit: BoxFit.cover));
  }
}
