import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveBonusCardUseCase {
  final Repository repository;

  RemoveBonusCardUseCase(this.repository);

  Future<Either<Failure, void>> call(String cardId) async {
    return await repository.removeBonusCard(cardId);
  }
}
