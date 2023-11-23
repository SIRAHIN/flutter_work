import 'package:findip/dataSource/getIpInfoDataSource.dart';
import 'package:findip/dataSource/ip_info_dataSource.dart';
import 'package:flutter/material.dart';
import 'widget/customButton.dart';
import 'widget/infoBodyText.dart';
import 'widget/infoTitleText.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController ipController = TextEditingController();
  
  String ipInfoText = 'No iP';

  String ip = "None";
  String city = "None";
  String region = "None";
  String country = "None";
  String loc = "None";
  String org = "None";
  String postal = "None";
  String timezone = "None";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff0F0817),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_.png"),
                  scale: 0.5,
                  alignment: Alignment.bottomCenter,
                  opacity: 0.5,
                  fit: BoxFit.fitWidth)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Logo
              Image.asset(
                "assets/logo.png",
                height: 130,
              ),
              const SizedBox(
                height: 25,
              ),

              //Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Urbanist'),
                  textAlign: TextAlign.center,
                  controller: ipController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    fillColor: const Color(0xff1E133E),
                    filled: true,
                    labelText: "Enter iP",
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Urbanist'),
                    hintText: "192.168.0.1",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(137, 158, 158, 158),
                        fontSize: 25,
                        fontFamily: 'Urbanist'),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //My Ip Button
                  custombuttons(
                    //crating callback fucntion
                    onPressed: () async {
                      String ipInfoDataSource = await ip_info.getMyiP();
                      ipController.text = ipInfoDataSource;
                      setState(() {
                        ipInfoText = ipController.text;
                      });
                    },
                    textbtn: "My IP",
                    ImgAssetsPath: "assets/myip.png",
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  //Get Info Button
                  custombuttons(
                   
                    onPressed: () async {
                      
                      Map ipDataSource = await ip_info_detailes.getDetailes(ipController.text);
                      setState(() {
                         ip = ipDataSource['ip'];
                         city = ipDataSource['city'];
                         region = ipDataSource['region'];
                         country = ipDataSource['country'];
                         loc = ipDataSource['loc'];
                         org = ipDataSource['org'];
                         postal = ipDataSource.containsKey('postal')? ipDataSource['postal'] : 'No postal found';
                         timezone = ipDataSource['timezone'];
                         ipInfoText = ipController.text;
                      });
                    },
                    textbtn: "Get Info",
                    ImgAssetsPath: "assets/searchip.png",
                  )
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              Column(
                children: [
                  Text(
                    "Information About the iP",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  Text(
                    ipInfoText,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        InfoTitleText(text: "Ip"),
                        InfoTitleText(text: "City"),
                        InfoTitleText(text: "Region"),
                        InfoTitleText(text: "Country"),
                        InfoTitleText(text: "Lat & Long"),
                        InfoTitleText(text: "Operator"),
                        InfoTitleText(text: "Postal Code"),
                        InfoTitleText(text: "Time zone")
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoBodyText(text: ip),
                        InfoBodyText(text: city),
                        InfoBodyText(text: region),
                        InfoBodyText(text: country),
                        InfoBodyText(text: loc),
                        InfoBodyText(
                              text:
                                  "${org.length > 20 ? org.substring(0, 20) : org}"),
                        InfoBodyText(text: postal),
                        InfoBodyText(text: timezone)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
