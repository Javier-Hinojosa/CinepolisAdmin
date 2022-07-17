import 'package:cinepolis_admin/app/pages/assigment_branch/widgets/assignment_horario.page.dart';
import 'package:cinepolis_admin/app/utils/msg.utils.dart';
import 'package:cinepolis_admin/core/common/extensors.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_schedule_response.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/salas.model.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/services/assigment/assignment.contract.dart';
import 'package:cinepolis_admin/data/services/movies/movies.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AssignmentBranchController extends GetxController {
final IAssignmentService _assignmentService;
final IMoviesService _moviesService;

  var loading = true.obs;
  var branches = <BranchModel>[];
  var selectBranchId=0.obs;
  var salas = <SalasModel>[];
  var selectMovieId=0.obs;
  var movies=<MoviesModel>[].obs;
  var selectSalaId=0.obs;
  var horarios= <AssignmentScheduleModel>[].obs;
  var isSpanish =true.obs;
  var insertDate= DateTime.now().obs;



// Forms
final FormGroup formAssets = FormGroup({
  'Inicia': FormControl<DateTime>(validators: [Validators.required], value: DateTime.now()),
  'isEspanish': FormControl<bool>(validators: [Validators.required], value: true),
});

  AssignmentBranchController(this._assignmentService,this._moviesService);


@override
  void onInit() async{
    super.onInit();
    await _getSchedules();
    movies.value=await _moviesService.getMovies();
    selectMovieId.value=movies.first.id!;
     await _assignmentService.getBranches().then((value) async {//va por las sucursales disponibles para despues guardarlas en un listado para una lista desplegable, se debe iniciarlizar la seleccion actual para que funcione.
      branches=value;
      selectBranchId.value=branches.first.id!;
     await  _getSalas(value.first.id!);
    });

    loading.value=false;
  }

  _getSchedules()async{
    horarios.value= await  _assignmentService.getSchedules();
  }

  _getSalas(int branchId)async{
  salas.clear();
   await _assignmentService.getSalas(branchId)
       .then((value) {
   if(value.isNotEmpty) salas=value;//al obtener la sucursal seleccionada este servicio trae las salas disponibles de cada sucursal, en algunos casos la sucursal no cuenta con salas, por lo que es necesario poner un vacio
   else salas.add(SalasModel.fromVoid());

       })
       .onError((error, stackTrace) {
         dynamic e;
         salas.add(SalasModel.fromVoid());
         return e;
       });
  return selectSalaId.value=salas.first.id!;
  }

  onRouteEdit(AssignmentScheduleModel element) async{
  await changeBranch(element.sala!.idSucursal!);
  await changeSala(element.sala!.id!);
  insertDate.value=DateTime.parse(element.inicia!);
  isSpanish.value=element.isEspanish!;
  selectMovieId.value=element.pelicula!.id!;
    Get.to(()=>AssignmentHorario(isAdd: false,id: element.id!));
  }

  onEdit(int id)async{
    var model= AssignmentScheduleResponseModel(
        id: id,
        idPelicula: selectMovieId.value,
        idSala: selectSalaId.value,
        inicia: insertDate.value.formatDateHour(),
        isEspanish: isSpanish.value
    );
    Get.back<AssignmentHorario>();
    await _assignmentService.modifySchedule(model).then((value) => SnackUtils.success("¡Se ah Modificado Correctamente!")).onError((error, stackTrace) =>  SnackUtils.error(error.toString(), "Advertencia"));
    await _getSchedules();
  }



  onDeleteh(int id) async{
    Get.back<AssignmentHorario>();
    await _assignmentService.deleteSchedule(id).then((value) => SnackUtils.success("¡Se ah Elimado Correctamente!")).onError((error, stackTrace) =>  SnackUtils.error(error.toString(), "Advertencia"));
    await _getSchedules();
  }

  confirmSave(BuildContext context) async{
    var model= AssignmentScheduleResponseModel(
        id: 0,
        idPelicula: selectMovieId.value,
        idSala: selectSalaId.value,
        inicia: insertDate.value.formatDateHour(),
        isEspanish: isSpanish.value
    );

    Get.back<AssignmentHorario>();
    await _assignmentService.addSchedule(model).then((value) => SnackUtils.success("¡Se ah Agregado Correctamente!")).onError((error, stackTrace) =>  SnackUtils.error(error.toString(), "Advertencia"));
    await _getSchedules();
  }

  //etos metodos funcionan como para cambiar la seleccion de alguna lista desplegable, tabla, hora etc. esto en algunas otras clases debera de volver a consumir el servicio para optener información nueva.
  onDateChange(DateTime date) {
  insertDate.value=date;
  }

  onHourChange(TimeOfDay date, context) {
  insertDate.value=DateTime(insertDate.value.year,insertDate.value.month,insertDate.value.day,date.hour,date.minute);
  }

  changeSala(int b) {
  selectSalaId.value=b;
  }

  changeMovie(int b) {
    selectMovieId.value=b;
  }

  changeBranch(int b) async{
  loading.value=true;
  selectBranchId.value=b;
  await _getSalas(b);
  loading.value=false;
  }




}