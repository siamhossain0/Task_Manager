import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_path.dart';

class screenBackground extends StatelessWidget {
  const screenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SvgPicture.asset(AssetsPath.backgroundSvg,fit: BoxFit.cover,
          height: screenSize.height,
          width: screenSize .width,
        ),
        child,
      ],

    );
  }
}