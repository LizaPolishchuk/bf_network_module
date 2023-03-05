class SuggestionPlace {
  final String placeId;
  final String name;

  SuggestionPlace(this.placeId, this.name);

  @override
  String toString() {
    return 'SuggestionPlace(name: $name, placeId: $placeId)';
  }
}

class Place {
  final String name;
  final double lat;
  final double lng;

  Place(this.name, this.lat, this.lng);
}