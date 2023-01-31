import '../../../../salons_app_flutter_module.dart';
import '../../repositories/repository.dart';

class SwitchMasterModeUseCase {
  final Repository repository;

  SwitchMasterModeUseCase(this.repository);

  Future<Either<Failure, void>> call(bool masterMode) async {
    return await repository.switchMasterMode(masterMode);
  }
}
