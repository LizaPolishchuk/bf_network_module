import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/order_entity.dart';
import 'package:bf_network_module/src/domain/entities/place_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetPlaceDetailsUseCase {
  final Repository repository;

  GetPlaceDetailsUseCase(this.repository);

  Future<Either<Failure, Place>> call(String placeId) async {
    return await repository.getPlaceDetailFromId(placeId);
  }
}
