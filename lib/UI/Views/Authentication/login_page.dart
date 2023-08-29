// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:country_code_picker/country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms_autofill/sms_autofill.dart';

// Project imports:
import 'package:app/Configs/custom_logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.sendOtp,
  }) : assert(sendOtp != null);

  final Function({
    required String dialCode,
    required String phoneNumber,
  }) sendOtp;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _dialCode = '';

  final _logger = CustomLogger.logger(LoginPage);

  // for auto retrieval of sms code
  Future<void> _listenForCode() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  void initState() {
    // to print the app signature for this application
    // which to be received in otp messages for auto retrieval
    SmsAutoFill().getAppSignature.then((value) {
      for (int i = 0; i < 10; i++) {
        _logger.v('app signature : $value');
      }
    });

    _listenForCode();

    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      // TODO: use text theme => headline size
                      fontSize: size.width / 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'There.',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      // TODO: use text theme => headline size
                      fontSize: size.width / 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    CountryCodePicker(
                      showDropDownButton: true,
                      onInit: (CountryCode? countryCode) {
                        _dialCode = countryCode?.dialCode ?? '';
                      },
                      initialSelection: 'IN',
                      favorite: const ['IN'],
                      onChanged: (CountryCode countryCode) {
                        _dialCode = countryCode.dialCode ?? '';
                      },
                    ),
                    SizedBox(
                      width: size.width / 1.25,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Phone number',
                            hintStyle: TextStyle(
                              fontFamily: 'Lato',
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            labelText: 'Phone Number for login',
                            labelStyle: TextStyle(
                                fontFamily: 'Lato', color: Colors.white),
                          ),
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              color: Colors.white),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          validator: (value) {
                            if (value?.isNotEmpty != true) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter your phone number');
                              return 'This field cannot be empty';
                            } else if (value?.length != 10) {
                              return 'Phone number should be of 10 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height / 10),
            Center(
              child: ButtonTheme(
                minWidth: size.width / 3.5,
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() != true) {
                      Fluttertoast.showToast(
                          msg: 'Please enter a valid phone number');
                      return;
                    } else {
                      _formKey.currentState?.save();
                      final String phoneNumber = _controller.text;

                      widget.sendOtp(
                        dialCode: _dialCode,
                        phoneNumber: phoneNumber,
                      );
                    }
                  },
                  color: Colors.red[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red[600]),
                  ),
                  child: const Text('Send OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
