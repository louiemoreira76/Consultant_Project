import 'package:flutter/material.dart';

class GifCantoSuperior extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double top;
  final double left;

  const GifCantoSuperior({
    super.key,
    required this.url,
    this.width = 100,
    this.height = 100,
    this.top = 10,
    this.left = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}