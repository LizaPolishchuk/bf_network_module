import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/salon_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateSalonUseCase {
  final Repository repository;

  UpdateSalonUseCase(this.repository);

  Future<Either<Failure, Salon>> call(Salon salon) async {
    return await repository.updateSalon(salon);
  }
}
