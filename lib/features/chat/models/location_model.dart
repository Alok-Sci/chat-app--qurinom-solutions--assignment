
class Location {
    final double latitude;
    final double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

    Location copyWith({
        double? latitude,
        double? longitude,
    }) => 
        Location(
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
