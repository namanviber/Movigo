class ApiConfing {
  static const _baseUrl = 'https://api.themoviedb.org/3/';
  static const _apiKey = '60b574988af5f6b7e4f9fd74504d7bbe';

  static Uri gerateUrl(String path) {
    final url = '$_baseUrl$path?api_key=$_apiKey';
    final uri = Uri.parse(url);
    return uri;
  }
}
