import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UnregisterTokenUseCase {
  final Repository repository;

  UnregisterTokenUseCase(this.repository);

  Future<Either<Failure, void>> call({required String authToken, required String pushToken}) async {
    return await repository.unregisterToken(authToken, pushToken);
  }
}
