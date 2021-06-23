import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithGoogleUseCase {
  final Repository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<Either<Failure, String>> call() {
    return repository.signInWithGoogle();
  }
}
