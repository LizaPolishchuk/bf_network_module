import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

import '../../repositories/repository.dart';

class GetOrdersListForCurrentUser {
  final Repository repository;

  GetOrdersListForCurrentUser(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await repository.getCurrentUserOrdersList();
  }
}
