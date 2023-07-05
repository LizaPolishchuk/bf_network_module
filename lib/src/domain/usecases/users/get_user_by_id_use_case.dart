import 'package:either_dart/either.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetUserUseCase {
  final Repository repository;

  GetUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String userId) async {
    return await repository.getUser(userId);
  }
}
