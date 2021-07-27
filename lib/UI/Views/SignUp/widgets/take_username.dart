import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/SignUp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TakeUsername extends StatefulWidget {
  const TakeUsername({
    Key key,
    @required this.usernameController,
    @required this.checkUsernameAvailability,
    @required this.addUsername,
  }) : super(key: key);

  final TextEditingController usernameController;
  final Future<bool> Function(String username) checkUsernameAvailability;
  final Function({@required bool available}) addUsername;

  @override
  _TakeUsernameState createState() => _TakeUsernameState();
}

class _TakeUsernameState extends State<TakeUsername> {
  bool _usernameAvailable = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeadingText(
              msg: 'Select Your Username!!',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  fontSize: 26,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 50),
            TextFormField(
              autofocus: true,
              controller: widget.usernameController,
              style: const TextStyle(color: Colors.white),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]')),
              ],
              decoration: InputDecoration(
                  helperText: widget.usernameController.text.length >= 3
                      ? _usernameAvailable
                          ? 'Username is available'
                          : 'Username is not available'
                      : 'Allowed Characters: a-z 0-9 _ (Min length: 3)',
                  helperStyle: !_usernameAvailable ||
                          widget.usernameController.text.length < 3
                      ? const TextStyle(fontFamily: 'Lato', color: Colors.red)
                      : const TextStyle(
                          fontFamily: 'Lato', color: Colors.green),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: widget.usernameController.text.length > 3
                          ? _usernameAvailable
                              ? const BorderSide(color: Colors.green)
                              : const BorderSide(color: Colors.redAccent)
                          : const BorderSide(color: Colors.redAccent))),
              textInputAction: TextInputAction.done,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLength: 25,
              onChanged: (val) async {
                if (val.isEmpty || val.length < 3) {
                  _usernameAvailable = false;
                  return;
                }
                val = val.toLowerCase();

                _usernameAvailable =
                    await widget.checkUsernameAvailability(val);
                setState(() {});
              },
              validator: (val) {
                if (val.isEmpty) return 'Please fill this field';
                if (val.length < 3) return 'Minimum length should be 3';

                return null;
              },
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                _usernameAvailable == true
                    ? 'This username can not be changed later'
                    : '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: size.height / 50),
            CustomButtons(
              icon: const Icon(
                FlutterIcons.arrow_alt_circle_right_faw5,
                size: 60,
              ),
              onTap: () {
                if (_usernameAvailable) {
                  widget.addUsername(available: _usernameAvailable);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
