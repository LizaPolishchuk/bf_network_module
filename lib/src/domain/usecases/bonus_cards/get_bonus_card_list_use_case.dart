import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/bonus_card_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetBonusCardListUseCase {
  final Repository repository;

  GetBonusCardListUseCase(this.repository);

  Future<Either<Failure, List<BonusCard>>> call(String salonId) async {
    return await repository.getBonusCardList(salonId);
  }
}
