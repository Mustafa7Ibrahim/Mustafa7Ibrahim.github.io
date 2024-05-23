// import 'package:firebase_database/firebase_database.dart';
import 'dart:developer';

import 'package:easix/easix.dart';
import 'package:mustafa_portfolio/core/core_data/about_me_model.dart';
import 'package:mustafa_portfolio/core/core_data/article_model.dart';
import 'package:mustafa_portfolio/core/core_data/certification_model.dart';
import 'package:mustafa_portfolio/core/core_data/education_model.dart';
import 'package:mustafa_portfolio/core/core_data/experience_model.dart';
import 'package:mustafa_portfolio/core/core_data/language_model.dart';
import 'package:mustafa_portfolio/core/core_data/packages_model.dart';
import 'package:mustafa_portfolio/core/core_data/project_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// DataRepository is a class that is used to get data from firebase.
class DataRepository {
  final _supabase = Supabase.instance.client;

  /// get articles from supabase
  Future<List<Article>> getArticles() async {
    final response = await _supabase.from('articles').select();
    final articles = getTypeList(response, Article.fromJson);
    log('articles: ${articles.first.name}');
    return articles;
  }

  /// get projects from supabase
  Future<List<Project>> getProjects() async {
    final response = await _supabase.from('projects').select();
    final projects = getTypeList(response, Project.fromJson);
    log('projects: ${projects.first.name}');
    return projects;
  }

  /// get experiences from supabase
  Future<List<Experience>> getExperiences() async {
    final response = await _supabase.from('experience').select();
    final experiences = getTypeList(response, Experience.fromJson);
    log('experiences: ${experiences.first.company}');
    return experiences;
  }

  /// get skills from supabase
  Future<List<String>> getSkills() async {
    final response = await _supabase.from('skills').select();
    final skills = getTypeList(
      response,
      (json) => json['description'] as String,
    );
    return skills;
  }

  /// get educations from supabase
  Future<List<Education>> getEducations() async {
    final response = await _supabase.from('education').select();
    final educations = getTypeList(response, Education.fromJson);
    log('educations: ${educations.first.school}');
    return educations;
  }

  /// get languages from supabase
  Future<List<Language>> getLanguages() async {
    final response = await _supabase.from('languages').select();
    final languages = getTypeList(response, Language.fromJson);
    log('languages: ${languages.first.name}');
    return languages;
  }

  /// get about me from supabase
  Future<AboutMe> getAboutMe() async {
    final response = await _supabase.from('about_me').select();
    final aboutMe = getTypeList(response, AboutMe.fromJson).first;
    return aboutMe;
  }

  /// get certifications from supabase
  Future<List<Certification>> getCertifications() async {
    final response = await _supabase.from('certifications').select();
    final certifications = getTypeList(response, Certification.fromJson);
    return certifications;
  }

  /// get packages from supabase
  Future<List<Package>> getPackages() async {
    final response = await _supabase.from('packages').select();
    final packages = getTypeList(response, Package.fromJson);
    return packages;
  }
}
