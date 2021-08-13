import 'package:app/UI/Views/HomeBase/Widgets/custom_image_provider.dart';
import 'package:app/UI/Views/HomeBase/search_page/widgets/grid_post_details_page.dart';
import 'package:flutter/material.dart';

class GridPopCard extends StatelessWidget {
  const GridPopCard({Key key, this.vidUrl, this.gifUrl}) : super(key: key);

  final String vidUrl;
  final String gifUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return GridPostDetails(
            vidUrl: vidUrl,
          );
        }));
      },
      child: SizedBox(
          child: CustomImageProvider(
        imgUrl: gifUrl,
      )),
    );
  }
}
