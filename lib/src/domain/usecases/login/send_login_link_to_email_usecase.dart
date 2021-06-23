import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class SendLoginLinkEmailUseCase {
  final Repository repository;

  SendLoginLinkEmailUseCase(this.repository);

  Future<Either<Failure, void>> call(String email) {
    return repository.sendLoginLinkToEmail(email);
  }
}
