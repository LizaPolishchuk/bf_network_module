import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemovePromoUseCase {
  final Repository repository;

  RemovePromoUseCase(this.repository);

  Future<Either<Failure, void>> call(String promoId) async {
    return await repository.removePromo(promoId);
  }
}
