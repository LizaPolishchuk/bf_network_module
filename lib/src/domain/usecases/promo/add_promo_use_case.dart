import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class AddPromoUseCase {
  final Repository repository;

  AddPromoUseCase(this.repository);

  Future<Either<Failure, Promo>> call(Promo promo) async {
    return await repository.addPromo(promo);
  }
}
