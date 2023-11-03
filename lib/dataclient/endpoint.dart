class Endpoint {
  static const apiScheme = "https";
  static const host = "localhost:8080";
  static const prefix = "/api/v1";

  static Uri uri(String path, [Map<String, dynamic>? queryParameters]) {
    Uri url = Uri(
        scheme: apiScheme,
        host: host,
        path: "$prefix$path",
        queryParameters: queryParameters);
    return url;
  }
}
