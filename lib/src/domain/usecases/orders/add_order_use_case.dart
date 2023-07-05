import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/order_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class AddOrderUseCase {
  final Repository repository;

  AddOrderUseCase(this.repository);

  Future<Either<Failure, OrderEntity>> call(OrderEntity order) async {
    return await repository.addOrder(order);
  }
}
