import 'package:flutter/cupertino.dart';

abstract class AuthProviderInterface {
  Future<void> initiate();

  Future<bool> sendOTP(String dialCode, String phoneNumber);

  Future<dynamic> submitOTP(String code);

  Future<void> logOut(BuildContext context);
}
