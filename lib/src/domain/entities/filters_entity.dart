import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/tokens_response.dart';

import '../../../salons_app_flutter_module.dart';
import 'user_entity.dart';

part 'filters_entity.g.dart';

@JsonSerializable()
class Filters {
  final String id;
  final Map<int, String>? popularCategories;
  final Map<int, String>? popularServices;

  Filters(this.id, this.popularCategories, this.popularServices);

  factory Filters.fromJson(Map<String, dynamic> json) {
    return _$FiltersEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FiltersEntityToJson(this);
}

