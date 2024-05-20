/// Represents a project in a portfolio.
class Project {
  /// Creates a new instance of the [Project] class.
  Project({
    required this.name,
    required this.description,
    required this.header,
    required this.googlePlayLink,
    required this.appStoreLink,
    required this.githubLink,
    required this.appGalleryLink,
    required this.pubDevLink,
    required this.images,
  });

  /// Creates a new instance of the [Project] class from a JSON object.
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'] as String,
      description: json['description'] as String,
      header: json['header'] as String?,
      googlePlayLink: json['google_play_link'] as String?,
      appStoreLink: json['app_store_link'] as String?,
      pubDevLink: json['pub_dev_link'] as String?,
      appGalleryLink: json['app_gallery_link'] as String?,
      githubLink: json['github_link'] as String?,
      images: List<String>.from(json['images'] as List<dynamic>),
    );
  }

  /// The name of the project.
  String name;

  /// The description of the project.
  String description;

  /// header of the project
  String? header;

  /// The Google Play Store link of the project (if applicable).
  String? googlePlayLink;

  /// The App Store link of the project (if applicable).
  String? appStoreLink;

  /// app gallery link
  String? appGalleryLink;

  /// pub.dev link
  String? pubDevLink;

  /// The GitHub repository link of the project.
  String? githubLink;

  /// The list of images associated with the project.
  List<String> images;
}
