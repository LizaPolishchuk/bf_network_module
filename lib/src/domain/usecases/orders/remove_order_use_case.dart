import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveOrderUseCase {
  final Repository repository;

  RemoveOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(String orderId) async {
    return await repository.removeOrder(orderId);
  }
}
