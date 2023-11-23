import 'package:flutter/material.dart';
import 'package:geolocation/constains/constants.dart';
import 'package:geolocation/provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: double.infinity,
          child: Consumer<GeoProvider>(
            builder: (context, value, child) => value.isLoding
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your Location ",
                        style: LargeText,
                      ),
                      Text(
                        "Lat : ${value.lat}",
                        style: mediumText,
                      ),
                      Text(
                        "Log : ${value.lon}",
                        style: mediumText,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
