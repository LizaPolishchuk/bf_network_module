import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class LoginWithPhoneUseCase {
  final Repository repository;

  LoginWithPhoneUseCase(this.repository);

  Future<Either<Failure, void>> call(String phone) {
    return repository.signInWithPhone(phone);
  }
}
