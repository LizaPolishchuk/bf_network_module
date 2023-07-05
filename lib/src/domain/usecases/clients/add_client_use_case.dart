import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class AddClientUseCase {
  final Repository repository;

  AddClientUseCase(this.repository);

  Future<Either<Failure, Client>> call(Client client) async {
    return await repository.addClient(client);
  }
}
