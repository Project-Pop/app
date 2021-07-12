// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:app/ConfigReader/config_reader.dart';
import 'secure_storage.dart';

class AuthService {
// making this class as singleton so that only one instance is ever created
  factory AuthService() {
    return _instance;
  }
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();

  static final _userPool = CognitoUserPool(
      ConfigReader.cognitoUserPoolId, ConfigReader.cognitoClientId,
      storage: CognitoMemoryStorage());

  CognitoUser _cognitoUser;

  CognitoUserSession cognitoSession;

  final _storage = SecureStorage();

  Future<bool> initCachedSession() async {
    final idToken = await _storage.getIdToken();
    final accessToken = await _storage.getAccessToken();
    final refreshToken = await _storage.getRefreshToken();

    if (idToken == null || accessToken == null || refreshToken == null) {
      _cognitoUser = null;
      cognitoSession = null;
      return false;
    }

    cognitoSession = CognitoUserSession(
        CognitoIdToken(idToken), CognitoAccessToken(accessToken),
        refreshToken: CognitoRefreshToken(refreshToken), clockDrift: 0);

    _cognitoUser = CognitoUser(
        cognitoSession.idToken.payload['phone_number'] as String, _userPool,
        storage: CognitoMemoryStorage());

    if (cognitoSession.isValid() == false) {
      await refreshSession();
    }
    return cognitoSession.isValid();
  }

  Future<void> refreshSession() async {
    if (cognitoSession == null || cognitoSession?.isValid() == true) return;

    cognitoSession =
        await _cognitoUser.refreshSession(cognitoSession.refreshToken);

    await _storage.setIdToken(cognitoSession.idToken.jwtToken);
    await _storage.setAccessToken(cognitoSession.accessToken.jwtToken);
    await _storage.setRefreshToken(cognitoSession.refreshToken.token);

    if (cognitoSession?.isValid() != true) {
      // user has to login again.
      cognitoSession = null;
      _cognitoUser = null;
    }
  }

  Future<bool> signUpWithCognito(String phone) async {
    final password = DateTime.now().toString();
    try {
      await _userPool.signUp(phone, password);

      Fluttertoast.showToast(msg: 'Succesfully registered');

      return true;
    } on CognitoClientException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.CENTER);
      return false;
    }
  }

  Future<dynamic> confirmOTP(String code) async {
    try {
      cognitoSession = await _cognitoUser.sendCustomChallengeAnswer(code);
      return true;
    } on CognitoUserCustomChallengeException catch (_) {
      return 'WRONG_OTP';
    } on CognitoClientException catch (e) {
      if (e.code == 'NotAuthorizedException') {
        return 'EXPIRED';
      }

      return false;
    }
  }

  Future sendOTP(String phone) async {
    _cognitoUser =
        CognitoUser(phone, _userPool, storage: CognitoMemoryStorage());

    try {
      await _cognitoUser
          .initiateAuth(AuthenticationDetails(authParameters: []));

      return false;
    } on CognitoUserCustomChallengeException catch (_) {
      // the package (amazon_cognito_identity_dart_2)
      // generates this error for custom_challenge
      // but there is no problem in that
      // because we need to send custom challenge answer.
      // and then we get the CognitoUserSession.
      return true;
    } on CognitoClientException catch (e) {
      return e.code;
    } catch (e) {
      return e.code;
    }
  }

  String get authToken => cognitoSession?.idToken?.jwtToken;
  bool get isAuthTokenValid => cognitoSession?.isValid();

  String get phoneNumber =>
      (cognitoSession?.idToken?.payload ?? {})['phone_number'];
}
