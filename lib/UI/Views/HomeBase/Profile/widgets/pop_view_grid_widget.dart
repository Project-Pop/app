// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

Widget cardPop() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/profile.png',
            ),
            fit: BoxFit.fill)),
  );
}

Widget addPhotoWidget() {
  return Container(
    height: 100,
    color: Colors.green[900],
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.add_a_photo, color: Colors.white, size: 25),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MyText(
              msg: 'Add Photo',
              maxLines: 1,
              textScaleFactor: 1.3,
              textStyle: TextStyle(fontSize: 15, color: Colors.white)),
        )
      ],
    )),
  );
}

//class for pop tag
class DyamicGridView extends StatelessWidget {
  const DyamicGridView({Key key, this.popList, this.isMinePop})
      : super(key: key);
  final List popList;
  final bool isMinePop;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        //shrinkWrap: true,
        crossAxisCount: 3,
        itemCount: isMinePop ? popList.length + 1 : popList.length,
        itemBuilder: (BuildContext context, int index) {
          return isMinePop == false && index == 0
              ? addPhotoWidget()
              : cardPop();
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.count(1, 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}

// class for camera tab
