// Dart imports:
import 'dart:async';

// Package imports:
import 'package:chopper/chopper.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/Services/Connectivity/connectivity_status.dart';

class ConnectivityInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request req) async {
    final connectivityResult = ConnectionStatus.getInstance().hasConnection;

    if (connectivityResult == false) {
      Fluttertoast.showToast(
          msg: 'Could not connect to internet, please check your connection.');
      return const Request('GET', 'https://www.google.com', '');
    }
    return req;
  }
}
