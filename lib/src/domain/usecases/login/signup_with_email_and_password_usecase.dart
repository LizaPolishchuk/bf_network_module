import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

import '../../../../bf_network_module.dart';

class SignUpWithEmailAndPasswordUseCase {
  final Repository repository;

  SignUpWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, Salon>> call(String email, String password) {
    return repository.signUpWithEmailAndPassword(email, password);
  }
}
