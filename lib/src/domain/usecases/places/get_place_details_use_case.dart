import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/place_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetPlaceDetailsUseCase {
  final Repository repository;

  GetPlaceDetailsUseCase(this.repository);

  Future<Either<Failure, Place>> call(String placeId) async {
    return await repository.getPlaceDetailFromId(placeId);
  }
}
