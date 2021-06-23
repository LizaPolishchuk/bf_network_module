import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetMastersListUseCase {
  final Repository repository;

  GetMastersListUseCase(this.repository);

  Future<Either<Failure, List<Master>>> call(String salonId) async {
    return await repository.getMastersList(salonId);
  }
}
