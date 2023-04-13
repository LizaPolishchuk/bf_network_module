enum PhotoType { user, salon, master }

class SignedUrlRequest {
  final String uuid;
  final PhotoType photoType;

  SignedUrlRequest(this.uuid, this.photoType);

  factory SignedUrlRequest.fromJson(Map<String, dynamic> json) {
    return SignedUrlRequest(
      json["uuid"],
      PhotoType.values.byName(json["photo_type"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uuid": uuid,
      "photo_type": photoType.name,
    };
  }
}
