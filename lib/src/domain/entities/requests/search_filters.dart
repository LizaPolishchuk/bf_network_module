import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/tokens_response.dart';

import '../../../../salons_app_flutter_module.dart';
import '../user_entity.dart';

part 'search_filters.g.dart';

@JsonSerializable()
class SearchFilters {
  final List<int>? services;
  final int? priceFrom;
  final int? priceTo;

  SearchFilters({this.services, this.priceFrom, this.priceTo});

  factory SearchFilters.fromJson(Map<String, dynamic> json) {
    return _$SearchFiltersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchFiltersToJson(this);
}
