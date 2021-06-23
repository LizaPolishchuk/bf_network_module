import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemoveServiceUseCase {
  final Repository repository;

  RemoveServiceUseCase(this.repository);

  Future<Either<Failure, void>> call(
      String salonId, Service serviceEntity) async {
    return await repository.removeService(salonId, serviceEntity);
  }
}
