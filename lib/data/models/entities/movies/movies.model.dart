class MoviesModel {
  MoviesModel({
    this.id,
    this.nombre,
    this.categorias,
    this.duracion,
    this.traierUrl,
    this.costo,
    this.photo,
    this.sinopsis,
    this.clasificacion,
    this.actores,
    this.directores,
    this.isEstreno,
  });

  int? id;
  String? nombre;
  String? categorias;
  int? duracion;
  String? traierUrl;
  double? costo;
  String? photo;
  String? sinopsis;
  String? clasificacion;
  String? actores;
  String? directores;
  dynamic isEstreno;

  factory MoviesModel.fromVoid() => MoviesModel(
        id: 0,
        nombre: '',
        categorias: '',
        duracion: 0,
        traierUrl: '',
        costo: 0,
        photo: '',
        sinopsis: '',
        clasificacion: '',
        actores: '',
        directores: '',
        isEstreno: '',
      );

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        categorias: json["categorias"] == null ? null : json["categorias"],
        duracion: json["duracion"] == null ? null : json["duracion"],
        traierUrl: json["traierUrl"] == null ? null : json["traierUrl"],
        costo: json["costo"] == null ? null : json["costo"].toDouble(),
        photo: json["photo"] == null ? null : json["photo"],
        sinopsis: json["sinopsis"] == null ? null : json["sinopsis"],
        clasificacion:
            json["clasificacion"] == null ? null : json["clasificacion"],
        actores: json["actores"] == null ? null : json["actores"],
        directores: json["directores"] == null ? null : json["directores"],
        isEstreno: json["isEstreno"] == null ? null : json["isEstreno"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "categorias": categorias == null ? null : categorias,
        "duracion": duracion == null ? null : duracion,
        "traierUrl": traierUrl == null ? null : traierUrl,
        "costo": costo == null ? null : costo,
        "photo": photo == null ? null : photo,
        "sinopsis": sinopsis == null ? null : sinopsis,
        "clasificacion": clasificacion == null ? null : clasificacion,
        "actores": actores == null ? null : actores,
        "directores": directores == null ? null : directores,
        "isEstreno": isEstreno == null ? null : isEstreno,
      };
}
