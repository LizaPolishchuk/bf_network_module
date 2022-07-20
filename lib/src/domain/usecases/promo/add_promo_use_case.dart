import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddPromoUseCase {
  final Repository repository;

  AddPromoUseCase(this.repository);

  Future<Either<Failure, Promo>> call(Promo promo) async {
    return await repository.addPromo(promo);
  }
}
