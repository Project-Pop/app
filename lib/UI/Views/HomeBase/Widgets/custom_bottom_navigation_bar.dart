// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {@required this.onTap, this.initialIndex = 0});

  final Function(int index) onTap;
  final int initialIndex;
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  Icon _buildNavIcon(IconData iconData, [bool isActive = false]) {
    return Icon(
      iconData,
      color: isActive ? Colors.green : Colors.white,
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData iconData) {
    return BottomNavigationBarItem(
      icon: _buildNavIcon(iconData),
      activeIcon: _buildNavIcon(iconData, true),
      label: '',
      backgroundColor: Colors.black,
      
    );
  }

  int currentIndex;
  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navItems = <BottomNavigationBarItem>[
      _buildNavItem(Icons.home),
      _buildNavItem(Icons.search),
      _buildNavItem(Icons.camera_alt_outlined),
      _buildNavItem(FlutterIcons.heart_evi),
      _buildNavItem(Icons.person),
    ];

    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: navItems,
      onTap: (index) {
        if (index == currentIndex) return;
        widget.onTap(index);
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
    );
  }
}
