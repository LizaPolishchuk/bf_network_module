import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/client_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateClientUseCase {
  final Repository repository;

  UpdateClientUseCase(this.repository);

  Future<Either<Failure, Client>> call(Client client) async {
    return await repository.updateClient(client);
  }
}
