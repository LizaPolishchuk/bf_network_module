import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/service_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetServicesListUseCase {
  final Repository repository;

  GetServicesListUseCase(this.repository);

  Future<Either<Failure, List<Service>>> call(String salonId, String? categoryId) async {
    return await repository.getServicesList(salonId, categoryId);
  }
}
