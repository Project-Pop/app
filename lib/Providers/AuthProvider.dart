import 'package:app/Services/AuthService/authService.dart';
import 'package:app/Services/AuthService/secureStorage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider with ChangeNotifier {
  final _storage = SecureStorage();

  final AuthService _authService = AuthService();

  bool _isAuthenticated = false;

  AuthProvider() {
    initiate();
  }

  Future<void> initCognitoSession() async {
    final idToken = await _storage.getIdToken();
    final accessToken = await _storage.getAccessToken();
    final refreshToken = await _storage.getRefreshToken();

    await _authService.initCachedSession(
        idToken: idToken, accessToken: accessToken, refreshToken: refreshToken);
  }

  Future<void> initiate() async {
    await initCognitoSession();
    if (userId != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

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

  Future<dynamic> submitOTP(String code) async {
    assert(code != null);
    final resp = await _authService.confirmOTP(code);

    if (resp == "EXPIRED") {
      Fluttertoast.showToast(msg: 'OTP expired, please try again');
      return resp;
    } else if (resp == "WRONG_OTP") {
      Fluttertoast.showToast(msg: 'Wrong otp, please try again');
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

  String get userId {
    return (_authService?.cognitoSession?.idToken?.payload ?? {})['sub'];
  }

  bool get isAuthenticated => _isAuthenticated;

  String get phoneNumber {
    return (_authService?.cognitoSession?.idToken?.payload ??
        {})['phone_number'];
  }

  String get authToken => _authService?.cognitoSession?.idToken?.jwtToken;

  bool get isAuthTokenValid => _authService?.cognitoSession?.isValid();
}
