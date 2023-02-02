import 'package:either_dart/either.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/place_entity.dart';
import 'package:salons_app_flutter_module/src/domain/repositories/repository.dart';

class SearchPlacesUseCase {
  final Repository repository;

  SearchPlacesUseCase(this.repository);

  Future<Either<Failure, List<SuggestionPlace>>> call(String input, String locale) async {
    return await repository.fetchPlaceSuggestions(input, locale);
  }
}
