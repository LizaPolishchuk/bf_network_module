import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateClientPhotoUseCase {
  final Repository repository;

  UpdateClientPhotoUseCase(this.repository);

  Future<Either<Failure, String>> call(String id, PickedFile file) async {
    return await repository.updateClientPhoto(id, file);
  }
}
