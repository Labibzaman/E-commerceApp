import 'package:flutter/material.dart';

import '../utility/assets_path.dart';

class AppLogo extends StatelessWidget {
   AppLogo({super.key,  this.Width,  this.height});
  final double? Width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logo,width: Width??120,height: height,);
  }
}
