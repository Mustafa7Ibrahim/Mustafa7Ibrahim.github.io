import 'dart:developer';

import 'package:mustafa_portfolio/core/core_data/my_data.dart';

/// Represents a portfolio.
class Portfolio {
  /// Creates a new instance of the [Portfolio] class.
  Portfolio({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
    required this.contact,
    required this.skills,
    required this.languages,
    required this.experience,
    required this.portfolioHeader,
    required this.projects,
    required this.education,
    required this.certifications,
    required this.articles,
  });

  /// Creates a new instance of the [Portfolio] class from a JSON object.
  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      name: json['name'] as String,
      title: json['title'] as String,
      bio: json['bio'] as String,
      image: json['image'] as String,
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      skills: List.from(json['skills'] as List),
      languages: List<Language>.from(
        (json['languages'] as List<dynamic>)
            .map((e) => Language.fromJson(e as Map<String, dynamic>)),
      ),
      experience: List<Experience>.from(
        (json['experience'] as List<dynamic>)
            .map((e) => Experience.fromJson(e as Map<String, dynamic>)),
      ),
      portfolioHeader: json['portfolio_header'] as String,
      projects: List<Project>.from(
        (json['projects'] as List<dynamic>)
            .map((e) => Project.fromJson(e as Map<String, dynamic>)),
      ),
      education: List<Education>.from(
        (json['education'] as List<dynamic>)
            .map((e) => Education.fromJson(e as Map<String, dynamic>)),
      ),
      certifications: List<Certification>.from(
        (json['certifications'] as List<dynamic>)
            .map((e) => Certification.fromJson(e as Map<String, dynamic>)),
      ),
      articles: List<Article>.from(
        (json['articles'] as List<dynamic>)
            .map((e) => Article.fromJson(e as Map<String, dynamic>)),
      ),
    );
  }

  /// New function to convert JSON to Portfolio
  factory Portfolio.getData() {
    log('myData: $myData');
    log('myData.runtimeType: ${Portfolio.fromJson(myData)}');
    return Portfolio.fromJson(myData);
  }

  /// The name of the portfolio owner.
  String name;

  /// The title of the portfolio owner.
  String title;

  /// The biography of the portfolio owner.
  String bio;

  /// The image URL of the portfolio owner.
  String image;

  /// The contact information of the portfolio owner.
  Contact contact;

  /// The list of skills of the portfolio owner.
  List<String> skills;

  /// The list of languages known by the portfolio owner.
  List<Language> languages;

  /// The list of work experiences of the portfolio owner.
  List<Experience> experience;

  /// The header of the portfolio.
  String portfolioHeader;

  /// The list of projects in the portfolio.
  List<Project> projects;

  /// The education information of the portfolio owner.
  List<Education> education;

  /// The list of certifications of the portfolio owner.
  List<Certification> certifications;

  /// The list of articles of the portfolio owner.
  List<Article> articles;
}

/// Represents the contact information of a portfolio owner.
class Contact {
  /// Creates a new instance of the [Contact] class.
  Contact({
    required this.phone,
    required this.address,
    required this.email,
    required this.github,
    required this.linkedin,
  });

  /// Creates a new instance of the [Contact] class from a JSON object.
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      phone: json['phone'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      github: json['github'] as String,
      linkedin: json['linkedin'] as String,
    );
  }

  /// The phone number of the portfolio owner.
  String phone;

  /// The address of the portfolio owner.
  String address;

  /// The email address of the portfolio owner.
  String email;

  /// The GitHub profile URL of the portfolio owner.
  String github;

  /// The LinkedIn profile URL of the portfolio owner.
  String linkedin;
}

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
      relevantCourses:
          List<String>.from(json['relevant_courses'] as List<dynamic>),
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
  List<String> relevantCourses;
}

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
