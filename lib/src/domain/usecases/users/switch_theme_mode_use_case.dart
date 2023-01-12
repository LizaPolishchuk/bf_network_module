import '../../../../salons_app_flutter_module.dart';
import '../../repositories/repository.dart';

class SwitchThemeModeUseCase {
  final Repository repository;

  SwitchThemeModeUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.switchThemeMode();
  }
}
