import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/filters_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetFiltersUseCase {
  final Repository repository;

  GetFiltersUseCase(this.repository);

  Future<Either<Failure, Filters>> call() async {
    return await repository.getFilters();
  }
}
