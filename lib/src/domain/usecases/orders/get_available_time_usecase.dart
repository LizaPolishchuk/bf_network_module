import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/order_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetAvailableTimeUseCase {
  final Repository repository;

  GetAvailableTimeUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call(
      String salonId, String serviceId, String masterId, String date) async {
    return await repository.getAvailableTime(salonId, serviceId, masterId, date);
  }
}
