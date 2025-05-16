import 'package:http_interceptor/http_interceptor.dart';
import 'package:oauth2/helpers/constant.dart';
import 'package:oauth2/services/api_interceptor.dart';

class ApiService {
  Client client = InterceptedClient.build(interceptors: [ApiInterceptor()]);

  Future<Response> getSecretArea() async {
    var secretUrl = Uri.parse('${Constants.baseUrl}/secret');
    final response = await client.get(secretUrl);
    return response;
  }
}