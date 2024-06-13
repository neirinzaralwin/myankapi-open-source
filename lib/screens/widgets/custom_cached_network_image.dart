import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  const CustomCachedNetworkImage(
      {super.key, required this.imageUrl, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    // cached network image widget
    return Container(
      height: imageWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: const DecorationImage(
          image: NetworkImage(
              "https://articles.connectnigeria.com/wp-content/uploads/2021/09/branding-1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
