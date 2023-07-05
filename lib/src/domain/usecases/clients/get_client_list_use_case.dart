import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/client_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetClientListUseCase {
  final Repository repository;

  GetClientListUseCase(this.repository);

  Future<Either<Failure, List<Client>>> call(String salonId) async {
    return await repository.getClientList(salonId);
  }
}
