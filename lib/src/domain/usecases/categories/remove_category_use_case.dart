import 'package:either_dart/either.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/domain/repositories/repository.dart';

class RemoveCategoryUseCase {
  final Repository repository;

  RemoveCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(String categoryId) async {
    return await repository.removeCategory(categoryId);
  }
}
