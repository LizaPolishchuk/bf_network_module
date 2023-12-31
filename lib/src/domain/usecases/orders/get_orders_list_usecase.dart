import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/order_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetOrdersListUseCase {
  final Repository repository;

  GetOrdersListUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call(String id, OrderForType orderForType,
      {String? dateFor, String? dateFrom, String? dateTo}) async {
    return await repository.getOrdersList(id, orderForType, dateFor, dateFrom, dateTo);
  }
}
