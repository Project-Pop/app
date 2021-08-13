// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/widgets/pop_view_grid_widget.dart';

class DyamicGridViewForCameraPops extends StatelessWidget {
  const DyamicGridViewForCameraPops({Key key, this.popList, this.isMinePop})
      : super(key: key);
  final List popList;
  final bool isMinePop;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: StaggeredGridView.countBuilder(
        // shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: isMinePop ? popList.length + 1 : popList.length,
        itemBuilder: (BuildContext context, int index) {
          return isMinePop == true && index == 0
              ? addPhotoWidget()
              : const CardPop();
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
