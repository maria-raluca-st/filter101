import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapper extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;
  const SvgWrapper(this.assetPath,
      {Key? key, this.height, this.width, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        assetPath,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
