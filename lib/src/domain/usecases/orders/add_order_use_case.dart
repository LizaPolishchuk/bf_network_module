import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddOrderUseCase {
  final Repository repository;

  AddOrderUseCase(this.repository);

  Future<Either<Failure, OrderEntity>> call(OrderEntity order) async {
    return await repository.addOrder(order);
  }
}
