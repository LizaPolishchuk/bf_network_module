import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetServicesListUseCase {
  final Repository repository;

  GetServicesListUseCase(this.repository);

  Future<Either<Failure, List<Service>>> call(String salonId, String? categoryId) async {
    return await repository.getServicesList(salonId, categoryId);
  }
}
