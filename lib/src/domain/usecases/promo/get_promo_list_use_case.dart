import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/promo_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetPromoListUseCase {
  final Repository repository;

  GetPromoListUseCase(this.repository);

  Future<Either<Failure, List<Promo>>> call(String salonId) async {
    return await repository.getPromoList(salonId);
  }
}
