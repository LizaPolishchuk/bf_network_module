import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemovePromoUseCase {
  final Repository repository;

  RemovePromoUseCase(this.repository);

  Future<Either<Failure, void>> call(String promoId) async {
    return await repository.removePromo(promoId);
  }
}
