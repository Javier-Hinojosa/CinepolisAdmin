

import 'package:cinepolis_admin/data/models/entities/users/user_detail.model.dart';

abstract class IUserService {
  Future<List<UserDetail>> getProfile(int id);
}
