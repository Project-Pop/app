// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  TabBarSliverPersistentHeaderDelegate({required this.child});
  static const TAG = 'TabBarSliverPersistentHeaderDelegate';

  Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.black,
      elevation: overlapsContent ? 4 : 0,
      child: child,
    );
  }

  @override
  double get maxExtent => 40.0;

  @override
  double get minExtent => 40.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
