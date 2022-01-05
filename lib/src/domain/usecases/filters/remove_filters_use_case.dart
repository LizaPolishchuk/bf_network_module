import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class RemoveFiltersUseCase {
  final Repository repository;

  RemoveFiltersUseCase(this.repository);

  Future<Either<Failure, void>> call(String filtersId) async {
    return await repository.removeFilters(filtersId);
  }
}
