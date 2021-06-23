import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetOrdersListUseCase {
  final Repository repository;

  GetOrdersListUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call(String id, OrderForType orderForType) async {
    return await repository.getOrdersList(id, orderForType);
  }
}
