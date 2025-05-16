import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:oauth2/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor implements InterceptorContract {
  final storage = const FlutterSecureStorage();
  final AuthService authService = AuthService();

  Future<String> get tokenOrEmpty async {
    var token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    String token = await tokenOrEmpty;
    try {
      request.headers["Authorization"] = "Bearer $token";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) async {
    var refreshToken = await storage.read(key: "refresh_token");
    if (response.statusCode == 401 && refreshToken != null) {
      var res = await authService.refreshToken(refreshToken);
      var data = jsonDecode(res!.body);
      await storage.write(key: "token", value: data['access_token']);
      await storage.write(key: "refresh_token", value: data['refresh_token']);
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}