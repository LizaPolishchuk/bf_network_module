import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/promo_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdatePromoUseCase {
  final Repository repository;

  UpdatePromoUseCase(this.repository);

  Future<Either<Failure, Promo>> call(Promo promo) async {
    return await repository.updatePromo(promo);
  }
}
