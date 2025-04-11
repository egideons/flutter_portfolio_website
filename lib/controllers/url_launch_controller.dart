import 'package:flutter/foundation.dart' show kIsWeb;
// Conditional import
import 'package:flutter_portfolio_website/core/utils/web_helper_stub.dart'
    if (dart.library.html) 'web_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchController {
  static Future<void> launchWeb(
    String url,
    LaunchMode launchMode, {
    String? headerKey,
    String? headerValue,
  }) async {
    if (kIsWeb) {
      openUrlInNewTab(url); // Now calls the correct implementation
    } else {
      final uri = Uri.parse(url);
      final canLaunch = await canLaunchUrl(uri);
      if (!canLaunch) {
        throw Exception('Could not launch $url');
      }

      await launchUrl(
        uri,
        mode: launchMode,
        webViewConfiguration: WebViewConfiguration(
          headers: headerKey != null && headerValue != null
              ? <String, String>{headerKey: headerValue}
              : const {},
        ),
      );
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> sendSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<void> sendMail(String emailAddress) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    await launchUrl(launchUri);
  }
}
