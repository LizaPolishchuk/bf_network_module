import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/master_entity.dart';
import 'package:bf_network_module/src/domain/entities/salon_entity.dart';
import 'package:bf_network_module/src/domain/entities/service_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetMastersListUseCase {
  final Repository repository;

  GetMastersListUseCase(this.repository);

  Future<Either<Failure, List<Master>>> call(String salonId, String? serviceId) async {
    return await repository.getMastersList(salonId, serviceId);
  }
}
