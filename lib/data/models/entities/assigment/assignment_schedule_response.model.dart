class AssignmentScheduleResponseModel {
  AssignmentScheduleResponseModel({
      this.id, 
      this.inicia, 
      this.isEspanish, 
      this.idPelicula, 
      this.idSala,});

  AssignmentScheduleResponseModel.fromJson(dynamic json) {
    id = json['Id'];
    inicia = json['Inicia'];
    isEspanish = json['isEspanish'];
    idPelicula = json['IdPelicula'];
    idSala = json['IdSala'];
  }
  int? id;
  String? inicia;
  bool? isEspanish;
  int? idPelicula;
  int? idSala;
AssignmentScheduleResponseModel copyWith({  int? id,
  String? inicia,
  bool? isEspanish,
  int? idPelicula,
  int? idSala,
}) => AssignmentScheduleResponseModel(  id: id ?? this.id,
  inicia: inicia ?? this.inicia,
  isEspanish: isEspanish ?? this.isEspanish,
  idPelicula: idPelicula ?? this.idPelicula,
  idSala: idSala ?? this.idSala,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Inicia'] = inicia;
    map['isEspanish'] = isEspanish;
    map['IdPelicula'] = idPelicula;
    map['IdSala'] = idSala;
    return map;
  }

}