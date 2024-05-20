/// Represents a language known by a portfolio owner.
class Language {
  /// Creates a new instance of the [Language] class.
  Language({
    required this.name,
    required this.proficiency,
  });

  /// Creates a new instance of the [Language] class from a JSON object.
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'] as String,
      proficiency: json['proficiency'] as String,
    );
  }

  /// The name of the language.
  String name;

  /// The proficiency level of the language.
  String proficiency;
}
