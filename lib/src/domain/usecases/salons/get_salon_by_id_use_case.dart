import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/salon_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetSalonByIdUseCase {
  final Repository repository;

  GetSalonByIdUseCase(this.repository);

  Future<Either<Failure, Salon>> call(String salonId) async {
    return await repository.getSalonById(salonId);
  }
}
