/// Represents a certification obtained by a portfolio owner.
class Certification {
  /// Creates a new instance of the [Certification] class.
  Certification({
    required this.name,
    required this.provider,
    required this.date,
  });

  /// Creates a new instance of the [Certification] class from a JSON object.
  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: json['name'] as String,
      provider: json['provider'] as String,
      date: json['date'] as String,
    );
  }

  /// The name of the certification.
  String name;

  /// The provider of the certification.
  String provider;

  /// The date when the certification was obtained.
  String date;
}
