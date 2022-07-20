import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/promo_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdatePromoUseCase {
  final Repository repository;

  UpdatePromoUseCase(this.repository);

  Future<Either<Failure, Promo>> call(Promo promo) async {
    return await repository.updatePromo(promo);
  }
}
