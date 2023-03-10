import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_request.g.dart';

@JsonSerializable()
class UploadPhotoRequest {
  final String url;
  @JsonKey(name: "photo_type")
  final String photoType;

  UploadPhotoRequest(this.url, this.photoType);

  factory UploadPhotoRequest.fromJson(Map<String, dynamic> json) {
    return _$UploadPhotoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UploadPhotoRequestToJson(this);
  }
}
