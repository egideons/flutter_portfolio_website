// This file is only used on web
import 'dart:html' as html;

void openUrlInNewTab(String url) {
  html.window.open(url, '_blank');
}
