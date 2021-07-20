// Flutter imports:
import 'package:app/Providers/AuthProvider/auth_provider_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/Services/AuthService/auth_service.dart';
import 'package:app/Services/AuthService/secure_storage.dart';

class AuthProvider with ChangeNotifier implements AuthProviderInterface {
  AuthProvider() {
    initiate();
  }

  final _storage = SecureStorage();

  final AuthService _authService = AuthService();

  bool _isAuthenticated = false;

  bool _loaded = false;

  @override
  Future<void> initiate() async {
    await _authService.initCachedSession();

    if (userId != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    _loaded = true;
    notifyListeners();
  }

  @override
  Future<bool> sendOTP(String dialCode, String phoneNumber) async {
    assert(dialCode != null);
    assert(phoneNumber != null);

    final phone = dialCode + phoneNumber;
    final response = await _authService.sendOTP(phone);
    if (response == true) {
      return true;
    } else if (response == 'UserLambdaValidationException') {
      // user hasn't signed up yet. so sign up the user
      final signUpResponse = await _authService.signUpWithCognito(phone);
      return signUpResponse;
    } else {
      Fluttertoast.showToast(msg: 'Unknown error, please contact the support');
      return false;
    }
  }

  @override
  Future<dynamic> submitOTP(String code) async {
    assert(code != null);
    final resp = await _authService.confirmOTP(code);

    if (resp == 'EXPIRED' || resp == 'WRONG_OTP') {
      return resp;
    } else if (resp == true) {
      _isAuthenticated = true;

      await _storage.setIdToken(_authService.cognitoSession.idToken.jwtToken);
      await _storage
          .setAccessToken(_authService.cognitoSession.accessToken.jwtToken);
      await _storage
          .setRefreshToken(_authService.cognitoSession.refreshToken.token);

      await initiate();
    }
    notifyListeners();
    return true;
  }

  @override
  Future<void> logOut(BuildContext context) async {
    await Future.wait([
      _storage.logout(),
    ]);

    Phoenix.rebirth(context);
  }

  // ----------------------getters---------------------------------

  String get userId {
    return (_authService?.cognitoSession?.idToken?.payload ?? {})['sub'];
  }

  bool get isAuthenticated => _isAuthenticated;
  bool get loaded => _loaded;

  String get phoneNumber => _authService?.phoneNumber;
}
