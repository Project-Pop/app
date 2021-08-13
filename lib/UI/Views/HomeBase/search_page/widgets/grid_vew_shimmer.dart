import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[900],
          highlightColor: Colors.grey[600],
          child: Container(
            color: Colors.black,
          )),
    );
  }
}
