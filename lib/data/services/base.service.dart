import 'package:cinepolis_admin/data/providers/api.provider.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
}//encargado de traer la configuración para poder consumir un endpoint
