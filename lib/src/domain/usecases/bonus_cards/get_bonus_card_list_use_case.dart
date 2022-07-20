import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/bonus_card_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetBonusCardListUseCase {
  final Repository repository;

  GetBonusCardListUseCase(this.repository);

  Future<Either<Failure, List<BonusCard>>> call(String salonId) async {
    return await repository.getBonusCardList(salonId);
  }
}
