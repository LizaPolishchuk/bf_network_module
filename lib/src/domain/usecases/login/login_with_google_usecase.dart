import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithGoogleUseCase {
  final Repository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<Either<Failure, Map<UserEntity, bool?>>> call() {
    return repository.signInWithGoogle();
  }
}
