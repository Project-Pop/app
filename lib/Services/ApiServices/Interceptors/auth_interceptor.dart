// Dart imports:
import 'dart:async';

// Package imports:
import 'package:chopper/chopper.dart';

class AuthInterceptor implements RequestInterceptor {
  Request removeNull(Request request) {
    final headers = {...request.headers};
    headers.removeWhere((key, value) => value == null);

    final queryParams = {...request.parameters};
    queryParams.removeWhere((key, value) => value == null);

    return request.copyWith(headers: headers, parameters: queryParams);
  }

  @override
  FutureOr<Request> onRequest(Request request) {
    request = removeNull(request);

    if (request.headers['noAuthRequired'] == 'true') {
      return request;
    } else {
      // TODO: add auth header

      return request
          .copyWith(headers: {...request.headers, 'authorization': ''});
    }
  }
}
