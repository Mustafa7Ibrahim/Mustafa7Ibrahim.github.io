/// Represents a project in a portfolio.
class Package {
  /// Creates a new instance of the [Package] class.
  Package({
    required this.name,
    required this.description,
    required this.header,
    required this.githubLink,
    required this.pubDevLink,
    required this.logo,
  });

  /// Creates a new instance of the [Package] class from a JSON object.
  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'] as String,
      description: json['description'] as String,
      header: json['header'] as String?,
      pubDevLink: json['pub_dev_link'] as String?,
      githubLink: json['github_link'] as String?,
      logo: json['logo'] as String?,
    );
  }

  /// The name of the project.
  String name;

  /// The description of the project.
  String description;

  /// header of the project
  String? header;

  /// pub.dev link
  String? pubDevLink;

  /// The GitHub repository link of the project.
  String? githubLink;

  /// logo
  String? logo;
}
