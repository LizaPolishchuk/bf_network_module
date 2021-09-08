import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithPhoneVerifyCodeUseCase {
  final Repository repository;

  LoginWithPhoneVerifyCodeUseCase(this.repository);

  Future<Either<Failure, String>> call(String code) {
    return repository.verifyCode(code);
  }
}
