import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class SignUpWithLinkAndEmailUseCase {
  final Repository repository;

  SignUpWithLinkAndEmailUseCase(this.repository);

  Future<Either<Failure, String>> call(String email) {
    return repository.signUpWithLinkAndEmail(email);
  }
}
