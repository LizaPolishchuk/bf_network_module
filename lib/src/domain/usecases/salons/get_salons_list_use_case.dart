import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetSalonsListUseCase {
  final Repository repository;

  GetSalonsListUseCase(this.repository);

  Future<Either<Failure, List<Salon>>> call(String userId) async {
    return await repository.getSalonsList(userId);
  }
}
