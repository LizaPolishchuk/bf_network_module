import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveMasterUseCase {
  final Repository repository;

  RemoveMasterUseCase(this.repository);

  Future<Either<Failure, void>> call(String masterId) async {
    return await repository.removeMaster(masterId);
  }
}
