import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/entities/requests/search_filters.dart';
import 'package:bf_network_module/src/domain/entities/salon_entity.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class GetSalonsListUseCase {
  final Repository repository;

  GetSalonsListUseCase(this.repository);

  Future<Either<Failure, List<Salon>>> call(
      {bool? loadTop, String? searchText, int? page, int? limit, SearchFilters? searchFilters}) async {
    return await repository.getSalonsList(loadTop, searchText, page, limit, searchFilters);
  }
}
