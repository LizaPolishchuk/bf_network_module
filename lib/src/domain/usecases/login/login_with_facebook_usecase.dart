import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/domain/entities/user_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';

class LoginWithFacebookUseCase {
  final Repository repository;

  LoginWithFacebookUseCase(this.repository);

  Future<Either<Failure, Map<UserEntity, bool?>>>? call() {
    return null;
    // return repository.signInWithFacebook();
  }
}
