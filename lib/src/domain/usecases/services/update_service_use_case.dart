import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/service_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateServiceUseCase {
  final Repository repository;

  UpdateServiceUseCase(this.repository);

  Future<Either<Failure, Service>> call(Service service) async {
    return await repository.updateService(service);
  }
}
