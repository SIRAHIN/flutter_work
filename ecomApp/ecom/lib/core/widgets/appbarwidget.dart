import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  String titleText;
  String BodyText;
   AppBarWidget({
    super.key,
    required this.titleText,
    required this.BodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,  
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'EncodeSans',
                fontWeight: FontWeight.normal),
          ),
          Text(
            BodyText, 
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'EncodeSans',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}