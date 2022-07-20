import 'package:image_picker/image_picker.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateClientPhotoUseCase {
  final Repository repository;

  UpdateClientPhotoUseCase(this.repository);

  Future<Either<Failure, String>> call(String id, PickedFile file) async {
    return await repository.updateClientPhoto(id, file);
  }
}
