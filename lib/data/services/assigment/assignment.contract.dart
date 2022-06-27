import 'package:cinepolis_admin/data/models/entities/assigment/assignment_branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/assignment_schedule_response.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/branch.model.dart';
import 'package:cinepolis_admin/data/models/entities/assigment/salas.model.dart';

abstract class IAssignmentService {
  Future<List<AssignmentScheduleModel>> getSchedules();
  Future addSchedule(AssignmentScheduleResponseModel assignmentScheduleResponseModel);
  Future modifySchedule(AssignmentScheduleResponseModel assignmentScheduleResponseModel);
  Future deleteSchedule(int id);
  Future<List<BranchModel>> getBranches();
  Future <List<SalasModel>> getSalas(int branchId);
}