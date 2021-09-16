import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddServiceUseCase {
  final Repository repository;

  AddServiceUseCase(this.repository);

  Future<Either<Failure, Service>> call(Service service) async {
    return await repository.addService(service);
  }
}
