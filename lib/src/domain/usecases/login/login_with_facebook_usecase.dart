import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithFacebookUseCase {
  final Repository repository;

  LoginWithFacebookUseCase(this.repository);

  Future<Either<Failure, String>> call() {
    return repository.signInWithFacebook();
  }
}
