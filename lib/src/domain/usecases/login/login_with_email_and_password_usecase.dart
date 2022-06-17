import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

import '../../../../salons_app_flutter_module.dart';

class LoginWithEmailAndPasswordUseCase {
  final Repository repository;

  LoginWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, Salon>> call(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
