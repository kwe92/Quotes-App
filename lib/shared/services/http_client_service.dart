import 'package:http/http.dart' as http;

class HttpClientService {
  static HttpClientService? _singleton;

  final http.Client client;

  HttpClientService._internal(this.client);

  factory HttpClientService(http.Client client) {
    _singleton ??= HttpClientService._internal(client);

    return _singleton!;
  }
}
