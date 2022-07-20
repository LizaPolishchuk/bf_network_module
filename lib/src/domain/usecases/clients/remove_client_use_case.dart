import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemoveClientUseCase {
  final Repository repository;

  RemoveClientUseCase(this.repository);

  Future<Either<Failure, void>> call(String clientId) async {
    return await repository.removeClient(clientId);
  }
}
