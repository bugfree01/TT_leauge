bool isValidUrl(String url){
  var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?";
  return RegExp(urlPattern, caseSensitive: false).hasMatch(url);
}