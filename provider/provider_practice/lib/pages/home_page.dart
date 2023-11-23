import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        builder: (context, child) =>  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<HomePageProvider>(
                builder: (context, value, child) =>  Text('${value.eligibilityMessage}', style: TextStyle(
                  color: (value.eligibility == true) ? Colors.green : Colors.red,
                ),),
              ),
               TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your Age',
                ),
                onChanged: (value) {
                  return Provider.of<HomePageProvider>(context, listen: false).changeEligibility(userInput: int.parse(value));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
