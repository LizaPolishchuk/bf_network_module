import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class SignUpWithEmailAndPasswordUseCase {
  final Repository repository;

  SignUpWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, String>> call(String email, String password) {
    return repository.signUpWithEmailAndPassword(email, password);
  }
}
