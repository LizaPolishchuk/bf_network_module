import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class SignUpWithLinkAndEmailUseCase {
  final Repository repository;

  SignUpWithLinkAndEmailUseCase(this.repository);

  Future<Either<Failure, String>> call(String email) {
    return repository.signUpWithLinkAndEmail(email);
  }
}
