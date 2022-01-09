import 'package:json_annotation/json_annotation.dart';

part 'base_response2.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse2<T> {
  final String? message;
  final T? data;

  BaseResponse2(this.message, this.data);

  factory BaseResponse2.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$BaseResponse2FromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponse2ToJson(this, toJsonT);
}
