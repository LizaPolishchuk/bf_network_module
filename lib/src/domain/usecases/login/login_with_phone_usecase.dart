import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithPhoneUseCase {
  final Repository repository;

  LoginWithPhoneUseCase(this.repository);

  Future<Either<Failure, bool?>> call(String phone) {
    return repository.signInWithPhone(phone);
  }
}
