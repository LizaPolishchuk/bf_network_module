import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateSalonPhotoUseCase {
  final Repository repository;

  UpdateSalonPhotoUseCase(this.repository);

  Future<Either<Failure, String>> call(PickedFile file) async {
    return await repository.updateSalonPhoto(file);
  }
}
