// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/SignUp/widgets/custom_button.dart';

class TakeName extends StatelessWidget {
  const TakeName({
    required this.nameController,
    required this.addName,
  });
  final TextEditingController nameController;
  final Function() addName;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeadingText(
            textAlign: TextAlign.center,
            msg: 'Whats Your Name!!',
            textStyle: TextStyle(
                color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (val) {
                    if ((val ?? '').isEmpty) return 'Please fill this field';
                    if ((val ?? '').length < 3) {
                      return 'Minimum length should be 3';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(height: size.height / 50),
            ]),
          ),
          const SizedBox(height: 50),
          CustomButtons(
            icon: const Icon(
              Icons.arrow_right,
              size: 60,
            ),
            onTap: () {
              addName();
            },
          ),
        ],
      ),
    );
  }
}
