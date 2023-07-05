import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/master_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateMasterUseCase {
  final Repository repository;

  UpdateMasterUseCase(this.repository);

  Future<Either<Failure, Master>> call(Master master) async {
    return await repository.updateMaster(master);
  }
}
