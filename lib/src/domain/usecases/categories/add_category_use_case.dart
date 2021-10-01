import 'package:dartz/dartz.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class AddCategoryUseCase {
  final Repository repository;

  AddCategoryUseCase(this.repository);

  Future<Either<Failure, Category>> call(Category category) async {
    return await repository.addCategory(category);
  }
}
