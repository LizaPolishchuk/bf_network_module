import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddClientUseCase {
  final Repository repository;

  AddClientUseCase(this.repository);

  Future<Either<Failure, Client>> call(Client client) async {
    return await repository.addClient(client);
  }
}
