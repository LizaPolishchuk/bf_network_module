import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateUserUseCase {
  final Repository repository;

  UpdateUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.updateUser(user);
  }
}
