import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/client_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateClientUseCase {
  final Repository repository;

  UpdateClientUseCase(this.repository);

  Future<Either<Failure, Client>> call(Client client) async {
    return await repository.updateClient(client);
  }
}
