class EmployeeDetail {
  EmployeeDetail({
    this.idEmpleado,
    this.noEmpleado,
    this.nombres,
    this.apaterno,
    this.amaterno,
    this.nss,
    this.idHorario,
    this.salario,
    this.bono,
    this.septimo,
    this.idEstatus,
    this.fechaIngreso,
    this.idUsuario,
    this.sincroniza,
    this.fechaAlta,
    this.ultModif,
    this.curp,
    this.fechaNacimiento,
    this.correoE,
    this.sinHuella,
    this.foto,
    this.genero,
    this.nombreCompleto,
    this.idPuesto,
    this.puesto,
    this.idDepartamento,
    this.departamento,
    this.idArea,
    this.area,
    this.idDivision,
    this.division,
    this.idSucursal,
    this.sucursal,
    this.telefono,
  });

  EmployeeDetail.fromJson(dynamic json) {
    idEmpleado = json['idEmpleado'];
    noEmpleado = json['noEmpleado'];
    nombres = json['nombres'];
    apaterno = json['apaterno'];
    amaterno = json['amaterno'];
    nss = json['nss'];
    idHorario = json['idHorario'];
    salario = json['salario'];
    bono = json['bono'];
    septimo = json['septimo'];
    idEstatus = json['idEstatus'];
    fechaIngreso = json['fechaIngreso'];
    idUsuario = json['idUsuario'];
    sincroniza = json['sincroniza'];
    fechaAlta = json['fechaAlta'];
    ultModif = json['ultModif'];
    curp = json['curp'];
    fechaNacimiento = json['fechaNacimiento'];
    correoE = json['correoE'];
    sinHuella = json['sinHuella'];
    foto = json['foto'];
    genero = json['genero'];
    nombreCompleto = json['nombreCompleto'];
    idPuesto = json['idPuesto'];
    puesto = json['puesto'];
    idDepartamento = json['idDepartamento'];
    departamento = json['departamento'];
    idArea = json['idArea'];
    area = json['area'];
    idDivision = json['idDivision'];
    division = json['division'];
    idSucursal = json['idSucursal'];
    sucursal = json['sucursal'];
    telefono = json['telefono'];
  }
  int? idEmpleado;
  String? noEmpleado;
  String? nombres;
  String? apaterno;
  String? amaterno;
  String? nss;
  int? idHorario;
  int? salario;
  int? bono;
  int? septimo;
  int? idEstatus;
  String? fechaIngreso;
  int? idUsuario;
  dynamic sincroniza;
  String? fechaAlta;
  String? ultModif;
  String? curp;
  String? fechaNacimiento;
  String? correoE;
  int? sinHuella;
  String? foto;
  String? genero;
  String? nombreCompleto;
  int? idPuesto;
  String? puesto;
  int? idDepartamento;
  String? departamento;
  int? idArea;
  String? area;
  int? idDivision;
  String? division;
  int? idSucursal;
  String? sucursal;
  var telefono;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idEmpleado'] = idEmpleado;
    map['noEmpleado'] = noEmpleado;
    map['nombres'] = nombres;
    map['apaterno'] = apaterno;
    map['amaterno'] = amaterno;
    map['nss'] = nss;
    map['idHorario'] = idHorario;
    map['salario'] = salario;
    map['bono'] = bono;
    map['septimo'] = septimo;
    map['idEstatus'] = idEstatus;
    map['fechaIngreso'] = fechaIngreso;
    map['idUsuario'] = idUsuario;
    map['sincroniza'] = sincroniza;
    map['fechaAlta'] = fechaAlta;
    map['ultModif'] = ultModif;
    map['curp'] = curp;
    map['fechaNacimiento'] = fechaNacimiento;
    map['correoE'] = correoE;
    map['sinHuella'] = sinHuella;
    map['foto'] = foto;
    map['genero'] = genero;
    map['nombreCompleto'] = nombreCompleto;
    map['idPuesto'] = idPuesto;
    map['puesto'] = puesto;
    map['idDepartamento'] = idDepartamento;
    map['departamento'] = departamento;
    map['idArea'] = idArea;
    map['area'] = area;
    map['idDivision'] = idDivision;
    map['division'] = division;
    map['idSucursal'] = idSucursal;
    map['sucursal'] = sucursal;
    map['telefono'] = telefono;
    return map;
  }
}
