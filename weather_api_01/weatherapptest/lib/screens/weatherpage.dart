// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapptest/model/weather_model.dart';
import '../providers/getloc_provider.dart';


class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  TextEditingController countryTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CityInputSection(countryTextcontroller: countryTextcontroller),
              
              const SizedBox(
                height: 25,
              ),
              
              TempCitySection(),
            
              const SizedBox(
                height: 25,
              ),
             
              ListofWeather(),
             
              WeatherDetailsSection(),
           
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          
        },
         child: Icon(Icons.location_pin,
         size: 35,
         ),
        ),
      ),
    );
  }
}



//________________________________________________________//
class WeatherDetailsSection extends StatelessWidget {
  const WeatherDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0,
          ),
          child: Text("More Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w100
          ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<GetLoc_Provider>(
            builder: (context, value, child) => 
          value.isLooding == false ?  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black12,
              ),
              height: 220,
              width: double.infinity,
              child: Consumer<GetLoc_Provider>(
                builder: (context, value, child) =>
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          children:  [
                            Text("Description",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Text("${value.weatherData?.weather?[0].description ?? '--.--'}" ,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.w100
                            ),
                            )
                          ],
                        ),
                    
                        Column(
                        children: [
                          Text("Feels like",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text("${value.weatherData?.main?.feelsLike ?? '--.--'}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w100
                          ),
                          )
                        ],
                      ),
                      ],),
                    ),
              
              
                      Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          children: [
                            Text("Humidity",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Text("${value.weatherData?.main?.humidity ?? '--.--'}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.w100
                            ),
                            )
                          ],
                        ),
                    
                        Column(
                        children: [
                          Text("Pressure",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text("${value.weatherData?.main?.pressure ?? '--.--'}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.w100
                          ),
                          )
                        ],
                      ),
                      ],),
                    ),
                  
              
                    
                    
                  ],
                ),
              ),
            ) : Center(child: CircularProgressIndicator())
          ),
        ),
      ],
    );
  }
}

class ListofWeather extends StatelessWidget {
  const ListofWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 110,
        width: double.infinity,
        //color: Colors.amber,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(4.0),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Monday'),
                    Icon(Icons.cloud),
                    Text(
                      '25',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TempCitySection extends StatelessWidget {
  const TempCitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<GetLoc_Provider>(
          builder: (context, value, child) => Text(
            '${value.weatherData?.main?.temp}°C',
            style: TextStyle(
                fontSize: 80,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w200),
          ),
        ),
        Consumer<GetLoc_Provider>(
          builder: (context, value, child) => Text(
            '${value.weatherData?.name ?? '--.--'}',
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w200),
          ),
        ),
      ],
    );
  }
}

class CityInputSection extends StatelessWidget {
  const CityInputSection({
    super.key,
    required this.countryTextcontroller,
  });

  final TextEditingController countryTextcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        
        controller: countryTextcontroller,
        decoration: InputDecoration(
            label: Text("Enter your city name"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            suffixIcon: IconButton(
              onPressed: () {
                Provider.of<GetLoc_Provider>(context, listen: false)
                    .getweatherApi(countryTextcontroller.text);
              },
              icon: Icon(Icons.send),
            )),
      ),
    );
  }
}
