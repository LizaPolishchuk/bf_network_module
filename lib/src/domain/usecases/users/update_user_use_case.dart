import 'package:either_dart/either.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateUserUseCase {
  final Repository repository;

  UpdateUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.updateUser(user);
  }
}
