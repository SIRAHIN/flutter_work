import 'package:flutter/material.dart';

 

class custombuttons extends StatelessWidget {
 
  String textbtn;
  String ImgAssetsPath;
  
  //creating callback funciton field
  final VoidCallback onPressed;

   custombuttons({
    super.key,
    required this.textbtn,
    required this.ImgAssetsPath, 
    required  this.onPressed
  });

 

  @override
  Widget build(BuildContext context) {
    return InkWell(

      //assign field funciton to onTap
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(183.0)),
        child: Container(
          color: Color(0xff886AE2),
          width: 150,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textbtn,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Urbanist'
                ),
              ),
              SizedBox(width: 5.0,),
              Image.asset(
                ImgAssetsPath,
                height: 34,
              )
            ],
          ),
        ),
      ),
    );
  }
}