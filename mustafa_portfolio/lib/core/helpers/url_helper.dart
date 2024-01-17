// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// launch url
Future<void> launchLink(String url) async {
  final url0 = Uri.parse(url);
  if (!await launchUrl(url0)) {
    throw Exception('Could not launch $url0');
  }
}

/// download file
Future<void> downloadFile(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final List<int> bytes = data.buffer.asUint8List();
  final fileName = assetPath.split('/').last;

  final blob = html.Blob([Uint8List.fromList(bytes)]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  html.AnchorElement(href: url)
    ..target = 'webbrowser'
    ..download = fileName
    ..click();

  html.Url.revokeObjectUrl(url);
}

/// download file from web
void downloadFileFromWeb(String url) {
  html.AnchorElement(href: url)
    ..target = 'webbrowser'
    ..download = url
    ..click();
  html.Url.revokeObjectUrl(url);
}
