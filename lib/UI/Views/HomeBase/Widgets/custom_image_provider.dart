import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageProvider extends StatelessWidget {
  const CustomImageProvider({Key key, this.imgUrl, this.imageProvider})
      : super(key: key);
  final String imgUrl;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Image.file(
      File(imgUrl),
      fit: BoxFit.fill,
    ));
  }
}

class CustomImageProviderForCircleImages extends StatelessWidget {
  const CustomImageProviderForCircleImages({Key key, this.imgUrl, this.radius})
      : super(key: key);
  final String imgUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: radius,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imgUrl,
          placeholder: (context, url) => const Center(
            child: Center(
              child: Text(
                'Loading',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
