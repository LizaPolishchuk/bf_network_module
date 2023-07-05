import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveClientUseCase {
  final Repository repository;

  RemoveClientUseCase(this.repository);

  Future<Either<Failure, void>> call(String clientId) async {
    return await repository.removeClient(clientId);
  }
}
