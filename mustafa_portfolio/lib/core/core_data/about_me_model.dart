/// AboutMe is a class that is used to get data from firebase.
class AboutMe {
  /// AboutMe is a class that is used to get data from firebase.
  AboutMe({
    required this.name,
    required this.image,
    required this.portfolioHeader,
    required this.cv,
    required this.bio,
    required this.address,
    required this.email,
    required this.github,
    required this.linkedin,
    required this.phone,
    required this.title,
  });

  /// fromJson is a factory method that is used to convert json to model.
  factory AboutMe.fromJson(Map<String, dynamic> json) => AboutMe(
        name: json['name'] as String,
        image: json['image'] as String,
        portfolioHeader: json['portfolio_header'] as String,
        cv: json['cv'] as String,
        bio: json['bio'] as String,
        address: json['address'] as String,
        email: json['email'] as String,
        github: json['github'] as String,
        linkedin: json['linkedin'] as String,
        phone: json['phone'] as String,
        title: json['title'] as String,
      );

  /// name
  final String name;

  /// image
  final String image;

  /// portfolioHeader
  final String portfolioHeader;

  /// cv
  final String cv;

  /// bio
  final String bio;

  /// address
  final String address;

  /// email
  final String email;

  /// github
  final String github;

  /// linkedin
  final String linkedin;

  /// phone
  final String phone;

  /// title
  final String title;

  /// toJson is a method that is used to convert model to json.
  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'portfolio_header': portfolioHeader,
        'cv': cv,
        'bio': bio,
        'address': address,
        'email': email,
        'github': github,
        'linkedin': linkedin,
        'phone': phone,
        'title': title,
      };
}
