import 'package:app/Providers/AuthProvider.dart';
import 'package:app/UI/Business/AuthenticatedState/authenticatedStateHandler.dart';
import 'package:app/UI/Business/InitProviders/initAuthProvider.dart';
import 'package:app/UI/Views/Authentication/loginPage.dart';
import 'package:app/UI/Views/Authentication/otpBox.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AuthHandler extends StatefulWidget {
  @override
  _AuthHandlerState createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  AuthProvider _authProvider;

  void _sendOtp({String dialCode, String phoneNumber}) async {
    assert(dialCode != null && phoneNumber != null);

    final resp = await _authProvider.sendOTP(dialCode, phoneNumber);
    if (resp) {
      Fluttertoast.showToast(msg: 'OTP is sent to ' + dialCode + phoneNumber);
      OTPBox.displayDialog(
        context: context,
        phoneNumber: phoneNumber,
        dialCode: dialCode,
        resendOtp: _resendOtp,
        submitOtp: _submitOtp,
      );
    }
  }

  Future<void> _resendOtp({String dialCode, String phoneNumber}) async {
    assert(dialCode != null && phoneNumber != null);

    Fluttertoast.showToast(msg: 'Resending OTP');
    await _authProvider.sendOTP(dialCode, phoneNumber);
    Fluttertoast.showToast(msg: 'OTP is sent to ' + dialCode + phoneNumber);
  }

  Future<bool> _submitOtp(String code,
      {String dialCode, String phoneNumber}) async {
    final resp = await _authProvider.submitOTP(code);

    if (resp == true) return true;

    if (resp == "EXPIRED") {
      Fluttertoast.showToast(msg: 'Expired, resending OTP');
      await _resendOtp(dialCode: dialCode, phoneNumber: phoneNumber);
    } else if (resp == "WRONG_OTP") {
      Fluttertoast.showToast(msg: 'Wrong OTP');
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return InitAuthProvider(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, loadingWidget) {
          this._authProvider = authProvider;

          if (authProvider.loaded == false) {
            return loadingWidget;
          }

          if (authProvider.isAuthenticated == false) {
            return LoginPage(sendOtp: _sendOtp);
          }

          return AuthenticatedStateHandler();
        },

        // TODO: define this loading widget in Views/
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
