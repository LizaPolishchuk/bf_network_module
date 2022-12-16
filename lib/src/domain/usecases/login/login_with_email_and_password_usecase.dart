import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithEmailAndPasswordUseCase {
  final Repository repository;

  LoginWithEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, Salon>> call(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
