import 'package:json_annotation/json_annotation.dart';

part 'filters_entity.g.dart';

@JsonSerializable()
class Filters {
  final String id;
  final Map<int, String>? popularServices;

  Filters(this.id, this.popularServices);

  factory Filters.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$FiltersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$FiltersToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }
}
