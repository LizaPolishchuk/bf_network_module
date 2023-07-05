import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class ChangePasswordUseCase {
  final Repository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, void>> call(String oldPassword, String newPassword) {
    return repository.changePassword(oldPassword, newPassword);
  }
}
