import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateSalonUseCase {
  final Repository repository;

  UpdateSalonUseCase(this.repository);

  Future<Either<Failure, Salon>> call(Salon salon) async {
    return await repository.updateSalon(salon);
  }
}
