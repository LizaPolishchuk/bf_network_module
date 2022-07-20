import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddBonusCardUseCase {
  final Repository repository;

  AddBonusCardUseCase(this.repository);

  Future<Either<Failure, BonusCard>> call(BonusCard bonusCard) async {
    return await repository.addBonusCard(bonusCard);
  }
}
