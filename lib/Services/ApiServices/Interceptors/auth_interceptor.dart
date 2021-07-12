// Dart imports:
import 'dart:async';

// Package imports:
import 'package:chopper/chopper.dart';

// Project imports:
import 'package:app/Services/AuthService/auth_service.dart';

class AuthInterceptor implements RequestInterceptor {
  Request removeNull(Request request) {
    final headers = {...request.headers};
    headers.removeWhere((key, value) => value == null);

    final queryParams = {...request.parameters};
    queryParams.removeWhere((key, value) => value == null);

    return request.copyWith(headers: headers, parameters: queryParams);
  }

  @override
  FutureOr<Request> onRequest(Request req) async {
    final request = removeNull(req);

    if (request.headers['noAuthRequired'] == 'true') {
      return request;
    } else {
      final _authService = AuthService();
      if (_authService.isAuthTokenValid == false) {
        await _authService.initCachedSession();
      }

      if (_authService.isAuthTokenValid == false) {
        // TODO: if auth token is still not valid then ask user to login again
        // may be Phoenix.rebirth after all logout operations
      }

      return request.copyWith(headers: {
        ...request.headers,
        'Authorization': _authService.authToken
      });
    }
  }
}
