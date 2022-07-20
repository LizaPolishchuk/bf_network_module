import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/bonus_card_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateBonusCardUseCase {
  final Repository repository;

  UpdateBonusCardUseCase(this.repository);

  Future<Either<Failure, BonusCard>> call(BonusCard bonusCard) async {
    return await repository.updateBonusCard(bonusCard);
  }
}
