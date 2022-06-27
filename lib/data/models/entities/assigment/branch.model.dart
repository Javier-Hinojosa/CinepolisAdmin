class BranchModel {
  BranchModel({
      this.id, 
      this.nombre, 
      this.direccion, 
      this.telefon,});

  BranchModel.fromJson(dynamic json) {
    id = json['id'];
    nombre = json['nombre'];
    direccion = json['direccion'];
    telefon = json['telefon'];
  }
  int? id;
  String? nombre;
  String? direccion;
  double? telefon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nombre'] = nombre;
    map['direccion'] = direccion;
    map['telefon'] = telefon;
    return map;
  }

}