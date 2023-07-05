import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class SignOutUseCase {
  final Repository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}
