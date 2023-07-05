import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveServiceUseCase {
  final Repository repository;

  RemoveServiceUseCase(this.repository);

  Future<Either<Failure, void>> call(String serviceId) async {
    return await repository.removeService(serviceId);
  }
}
