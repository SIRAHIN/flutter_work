import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CircleIcons extends StatelessWidget {
  String ImgUrl;
   CircleIcons({
    super.key,
    required this.ImgUrl
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Container(
        child: Image.asset(
          ImgUrl,
          width: 24.h,
        ),
      ),
      //backgroundImage: AssetImage(CustomesIcons.backArrow),
      backgroundColor: Colors.white,
    );
  }
}