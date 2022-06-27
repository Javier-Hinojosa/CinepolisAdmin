import 'package:cinepolis_admin/data/models/entities/assigment/salas.model.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';

class AssignmentScheduleModel {
  AssignmentScheduleModel({
      this.id, 
      this.inicia, 
      this.isEspanish, 
      this.pelicula, 
      this.sala,});

  AssignmentScheduleModel.fromJson(dynamic json) {
    id = json['id'];
    inicia = json['inicia'];
    isEspanish = json['isEspanish'];
    pelicula = json['pelicula'] != null ? MoviesModel.fromJson(json['pelicula']) : null;
    sala = json['sala'] != null ? SalasModel.fromJson(json['sala']) : null;
  }
  int? id;
  String? inicia;
  bool? isEspanish;
  MoviesModel? pelicula;
  SalasModel? sala;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['inicia'] = inicia;
    map['isEspanish'] = isEspanish;
    if (pelicula != null) {
      map['pelicula'] = pelicula?.toJson();
    }
    if (sala != null) {
      map['sala'] = sala?.toJson();
    }
    return map;
  }

}