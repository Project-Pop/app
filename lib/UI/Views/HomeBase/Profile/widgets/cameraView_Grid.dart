
import 'package:app/UI/Views/HomeBase/Profile/widgets/popView_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DyamicGridViewForCameraPops extends StatelessWidget {
  const DyamicGridViewForCameraPops({Key key, this.popList, this.isMinePop})
      : super(key: key);
  final List popList;
  final bool isMinePop;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: StaggeredGridView.countBuilder(
        // shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: isMinePop ? popList.length + 1 : popList.length,
        itemBuilder: (BuildContext context, int index) {
          return isMinePop == true && index == 0 ? addPhotoWidget() : cardPop();
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
