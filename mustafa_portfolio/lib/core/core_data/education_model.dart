/// Represents the education information of a portfolio owner.
class Education {
  /// Creates a new instance of the [Education] class.
  Education({
    required this.degree,
    required this.school,
    required this.location,
    required this.major,
    required this.gpa,
    required this.duration,
    required this.description,
    required this.relevantCourses,
  });

  /// Creates a new instance of the [Education] class from a JSON object.
  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'] as String,
      school: json['school'] as String,
      location: json['location'] as String,
      major: json['major'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
      gpa: (json['gpa'] as num).toDouble(),
      relevantCourses: json['relevant_courses'] as String,
    );
  }

  /// The degree obtained by the portfolio owner.
  String degree;

  /// The name of the school or university.
  String school;

  /// The location of the school or university.
  String location;

  /// The major or field of study.
  String major;

  /// The GPA (Grade Point Average) of the portfolio owner.
  double gpa;

  /// The description of the education.
  String description;

  /// The duration of the education.
  String duration;

  /// The list of relevant courses taken by the portfolio owner.
  String relevantCourses;
}
