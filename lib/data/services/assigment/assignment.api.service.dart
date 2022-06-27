import 'dart:convert';

import 'package:cinepolis_admin/core/values/enviroments.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_schedule_response.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/salas.model.dart';
import 'package:cinepolis_admin/data/models/entities/movies/movies.model.dart';
import 'package:cinepolis_admin/data/models/enums/request_method.enum.dart';
import 'package:cinepolis_admin/data/services/assigment/assignment.contract.dart';
import 'package:cinepolis_admin/data/services/base.service.dart';

class AssignmentApiService extends BaseService implements IAssignmentService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<AssignmentScheduleModel>> getSchedules() async{
    var userJson = await provider.request<AssignmentScheduleModel>(
        RequestMethod.get, "${_recruitmentUrl}api/branch/horarios/all",
        useDefaultUrl: false);
    return List<AssignmentScheduleModel>.from(userJson.map((x) => AssignmentScheduleModel.fromJson(x)));
  }

  @override
  Future addSchedule(AssignmentScheduleResponseModel assignmentScheduleResponseModel)async  {
    Map<String, dynamic> movieJson = assignmentScheduleResponseModel.toJson();
    var bodyMovie = json.encode(movieJson);

    return await provider.request<MoviesModel>(
        RequestMethod.post, "${_recruitmentUrl}api/branch/horario",
        useDefaultUrl: false, body: bodyMovie);
  }

  @override
  Future deleteSchedule(int id)async {
    return await provider.request(
        RequestMethod.delete, "${_recruitmentUrl}api/branch/horario/$id",
        useDefaultUrl: false);
  }

  @override
  Future modifySchedule(AssignmentScheduleResponseModel assignmentScheduleResponseModel)async {
    Map<String, dynamic> movieJson = assignmentScheduleResponseModel.toJson();
    var bodyMovie = json.encode(movieJson);

    return await provider.request<MoviesModel>(
        RequestMethod.post, "${_recruitmentUrl}api/branch/horario/modify",
        useDefaultUrl: false, body: bodyMovie);
  }

  @override
  Future<List<BranchModel>> getBranches() async{
    var userJson = await provider.request<BranchModel>(
        RequestMethod.get, "${_recruitmentUrl}api/branch/all",
        useDefaultUrl: false);
    return List<BranchModel>.from(userJson.map((x) => BranchModel.fromJson(x)));
  }

  @override
  Future<List<SalasModel>> getSalas(int branchId) async{
    var userJson = await provider.request<SalasModel>(
        RequestMethod.get, "${_recruitmentUrl}api/branch/salas/$branchId",
        useDefaultUrl: false);
    return List<SalasModel>.from(userJson.map((x) => SalasModel.fromJson(x)));
  }





}