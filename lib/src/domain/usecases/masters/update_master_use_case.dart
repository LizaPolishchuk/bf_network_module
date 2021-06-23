import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateMasterUseCase {
  final Repository repository;

  UpdateMasterUseCase(this.repository);

  Future<Either<Failure, void>> call(Master master) async {
    return await repository.updateMaster(master);
  }
}
