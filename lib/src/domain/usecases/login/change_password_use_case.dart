import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';


class ChangePasswordUseCase {
  final Repository repository;

  ChangePasswordUseCase(this.repository);

  Future<Either<Failure, void>> call(String oldPassword, String newPassword) {
    return repository.changePassword(oldPassword, newPassword);
  }
}
