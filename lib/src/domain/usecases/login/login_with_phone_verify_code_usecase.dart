import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/user_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class LoginWithPhoneVerifyCodeUseCase {
  final Repository repository;

  LoginWithPhoneVerifyCodeUseCase(this.repository);

  Future<Either<Failure, Map<UserEntity, bool?>>> call(String code, String phoneNumber) {
    return repository.verifyCode(code, phoneNumber);
  }
}
