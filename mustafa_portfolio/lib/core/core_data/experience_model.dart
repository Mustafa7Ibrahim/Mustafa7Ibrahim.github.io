/// Represents a work experience of a portfolio owner.
class Experience {
  /// Creates a new instance of the [Experience] class.
  Experience({
    required this.position,
    required this.company,
    required this.location,
    required this.duration,
    required this.description,
  });

  /// Creates a new instance of the [Experience] class from a JSON object.
  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      position: json['position'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
    );
  }

  /// The position in the company.
  String position;

  /// The name of the company.
  String company;

  /// The location of the company.
  String location;

  /// The duration of the work experience.
  String duration;

  /// The description of the work experience.
  String description;
}
