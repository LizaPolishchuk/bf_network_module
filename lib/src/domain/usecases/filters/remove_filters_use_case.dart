import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveFiltersUseCase {
  final Repository repository;

  RemoveFiltersUseCase(this.repository);

  Future<Either<Failure, void>> call(String filtersId) async {
    return await repository.removeFilters(filtersId);
  }
}
