import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemoveOrderUseCase {
  final Repository repository;

  RemoveOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(OrderEntity order) async {
    return await repository.removeOrder(order);
  }
}
