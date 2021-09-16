import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemoveServiceUseCase {
  final Repository repository;

  RemoveServiceUseCase(this.repository);

  Future<Either<Failure, void>> call(String serviceId) async {
    return await repository.removeService(serviceId);
  }
}
