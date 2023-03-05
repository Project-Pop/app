// Flutter imports:
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/AuthenticatedState/authenticated_state_handler.dart';
import 'package:app/UI/Views/Authentication/login_page.dart';
import 'package:app/UI/Views/Authentication/otp_box.dart';

class AuthHandler extends StatefulWidget {
  @override
  _AuthHandlerState createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  AuthProvider? _authProvider;

  Future<void> _sendOtp({
    required String dialCode,
    required String phoneNumber,
  }) async {
    assert(dialCode != null && phoneNumber != null);

    final resp = (await _authProvider?.sendOTP(dialCode, phoneNumber)) ?? false;
    if (resp) {
      Fluttertoast.showToast(msg: 'OTP is sent to $dialCode $phoneNumber');
      OTPBox.displayDialog(
        context: context,
        phoneNumber: phoneNumber,
        dialCode: dialCode,
        resendOtp: _resendOtp,
        submitOtp: _submitOtp,
      );
    }
  }

  Future<void> _resendOtp({
    required String dialCode,
    required String phoneNumber,
  }) async {
    Fluttertoast.showToast(msg: 'Resending OTP');
    await _authProvider?.sendOTP(dialCode, phoneNumber);
    Fluttertoast.showToast(msg: 'OTP is sent to $dialCode $phoneNumber');
  }

  Future<bool> _submitOtp(String code,
      {required String dialCode, required String phoneNumber}) async {
    final resp = await _authProvider?.submitOTP(code);

    if (resp == true) return true;

    if (resp == 'EXPIRED') {
      Fluttertoast.showToast(msg: 'Expired, resending OTP');
      await _resendOtp(dialCode: dialCode, phoneNumber: phoneNumber);
    } else if (resp == 'WRONG_OTP') {
      Fluttertoast.showToast(msg: 'Wrong OTP');
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, loadingWidget) {
        _authProvider = authProvider;

        if (authProvider.loaded == false) {
          return loadingWidget!;
        }

        if (authProvider.isAuthenticated == false) {
          return LoginPage(sendOtp: _sendOtp);
        }

        return AuthenticatedStateHandler();
      },

      // TODO: define this loading widget in Views/
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
