class SalasModel {
  SalasModel({
      this.id, 
      this.sala, 
      this.capacidad, 
      this.idSucursal, 
      this.ocupados,});

  SalasModel.fromJson(dynamic json) {
    id = json['id'];
    sala = json['sala'];
    capacidad = json['capacidad'];
    idSucursal = json['idSucursal'];
    ocupados = json['ocupados'];
  }

  SalasModel.fromVoid() {
    id = 0;
    sala = 0;
    capacidad = 0;
    idSucursal = 0;
    ocupados = 0;
  }
  int? id;
  int? sala;
  int? capacidad;
  int? idSucursal;
  int? ocupados;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sala'] = sala;
    map['capacidad'] = capacidad;
    map['idSucursal'] = idSucursal;
    map['ocupados'] = ocupados;
    return map;
  }

}