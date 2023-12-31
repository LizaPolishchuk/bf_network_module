import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/master_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class AddMasterUseCase {
  final Repository repository;

  AddMasterUseCase(this.repository);

  Future<Either<Failure, Master>> call(Master master) async {
    return await repository.addMaster(master);
  }
}
