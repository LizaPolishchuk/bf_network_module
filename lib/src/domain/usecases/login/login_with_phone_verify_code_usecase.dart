import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/user_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class LoginWithPhoneVerifyCodeUseCase {
  final Repository repository;

  LoginWithPhoneVerifyCodeUseCase(this.repository);

  Future<Either<Failure, Map<UserEntity, bool?>>> call(String code, String phoneNumber) {
    return repository.verifyCode(code, phoneNumber);
  }
}
