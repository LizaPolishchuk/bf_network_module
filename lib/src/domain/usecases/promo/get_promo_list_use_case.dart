import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/promo_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetPromoListUseCase {
  final Repository repository;

  GetPromoListUseCase(this.repository);

  Future<Either<Failure, List<Promo>>> call(String salonId) async {
    return await repository.getPromoList(salonId);
  }
}
