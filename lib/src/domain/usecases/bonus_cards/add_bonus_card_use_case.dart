import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class AddBonusCardUseCase {
  final Repository repository;

  AddBonusCardUseCase(this.repository);

  Future<Either<Failure, BonusCard>> call(BonusCard bonusCard) async {
    return await repository.addBonusCard(bonusCard);
  }
}
