// Flutter imports:
import 'package:flutter/material.dart';

class HomeBase extends StatelessWidget {
  const HomeBase({
    required this.pages,
    required this.controller,
    required this.bottomNavigationBar,
  });
  final List<Widget> pages;
  final PageController controller;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      body: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
