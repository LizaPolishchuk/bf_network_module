import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UploadPhotoRequest {
  final String url;
  @JsonKey(name: "photo_type")
  final String photoType;

  UploadPhotoRequest(this.url, this.photoType);
}
