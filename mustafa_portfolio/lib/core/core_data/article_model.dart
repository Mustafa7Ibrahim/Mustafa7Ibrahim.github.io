/// Represents an article.
class Article {
  /// Creates a new instance of the [Article] class.
  Article({
    required this.name,
    required this.description,
    required this.devToLink,
    required this.hashnodeLink,
    required this.mediumLink,
  });

  /// Creates a new instance of the [Article] class from a JSON object.
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      name: json['name'] as String,
      description: json['description'] as String,
      devToLink: json['dev_to_link'] as String?,
      hashnodeLink: json['hashnode_link'] as String?,
      mediumLink: json['medium_link'] as String?,
    );
  }

  /// The name of the article.
  final String name;

  /// The description of the article.
  final String description;

  /// The link to the article on dev.to.
  final String? devToLink;

  /// The link to the article on Hashnode.
  final String? hashnodeLink;

  /// The link to the article on Medium.
  final String? mediumLink;
}
