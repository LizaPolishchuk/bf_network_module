import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class GetCategoriesListUseCase {
  final Repository repository;

  GetCategoriesListUseCase(this.repository);

  Future<Either<Failure, List<Category>>> call(String salonId) async {
    return await repository.getCategoryList(salonId);
  }
}
