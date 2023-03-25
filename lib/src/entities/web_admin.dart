import 'package:json_annotation/json_annotation.dart';

part 'web_admin.g.dart';

@JsonSerializable()
class WebAdmin {
  final String firstname;
  final String lastname;
  final String email;

  WebAdmin(this.firstname, this.lastname, this.email);

  factory WebAdmin.fromJson(Map<String, dynamic> json) => _$WebAdminFromJson(json);

  Map<String, dynamic> toJson() => _$WebAdminToJson(this);
}