import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/filters_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class UpdateFiltersUseCase {
  final Repository repository;

  UpdateFiltersUseCase(this.repository);

  Future<Either<Failure, Filters>> call(Filters filters) async {
    return await repository.updateFilters(filters);
  }
}
