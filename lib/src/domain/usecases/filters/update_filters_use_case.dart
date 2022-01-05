import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/filters_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class UpdateFiltersUseCase {
  final Repository repository;

  UpdateFiltersUseCase(this.repository);

  Future<Either<Failure, Filters>> call(Filters filters) async {
    return await repository.updateFilters(filters);
  }
}
