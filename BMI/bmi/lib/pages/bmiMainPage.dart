import 'package:bmi/providers/bmiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiMainPage extends StatelessWidget {
  const BmiMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('B M I'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            //top level
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Provider.of<BmiProvider>(context, listen: false)
                            .selectGendercolor('male');
                      },
                      child: Consumer<BmiProvider>(
                        builder: (context, value, child) => 
                        GenderContainer(
                          color: value.MaleColor,
                          text: 'Male',
                          icons: Icon(
                            Icons.male_sharp,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Provider.of<BmiProvider>(context, listen: false)
                            .selectGendercolor('female');
                      },
                      child: Consumer<BmiProvider>(
                        builder: (context, value, child) => 
                        GenderContainer(
                          text: 'Female',
                          icons: Icon(
                            Icons.female_sharp,
                            size: 40,
                          ),
                          color: value.FemaleColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //mid level
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.deepPurple,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Consumer<BmiProvider>(
                            builder: (context, value, child) => 
                            Text(
                              '${value.sliderValue.toInt()}',
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(' cm')
                        ],
                      ),
                      Consumer<BmiProvider>(
                        builder: (context, value, child) => 
                        Slider(
                          value: value.sliderValue,
                          min: 120.0,
                          max: 200.0,
                          activeColor: Colors.amberAccent,
                          onChanged: (value) {
                            Provider.of<BmiProvider>(context, listen: false)
                                .getSliderValue(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //bottom level
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<BmiProvider>(
                      builder: (context, value, child) => 
                       WeightmeasureContainer(
                        text: 'Weight',
                        text2: '${value.weight}',
                        addfunc: () => Provider.of<BmiProvider>(context, listen: false).AddWeight(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Consumer<BmiProvider>(
                      builder: (context, value, child) => 
                      AgemeasureContainer(
                        text: 'age',
                        text2: '${value.age}',
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Calculate Button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  double result = Provider.of<BmiProvider>(context , listen: false).calculateBmi();
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Your BMI Result"),
                      content: Text('${result.toString().substring(4,6)}.0', style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                      ),),
                      actions: [TextButton(onPressed: ()  {
                        Provider.of<BmiProvider>(context,listen: false).resetvalue();
                        Navigator.pop(context);
                      }, child: Text("Again Check"))],
                    );
                  },);
                },
                child: Container(
                  height: 70,
                  color: Colors.deepOrange,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}





//----------------------------------------------------//

// top genderContainer
class GenderContainer extends StatelessWidget {
  final String? text;
  final Icon? icons;
  final Color? color;

  const GenderContainer({super.key, this.text, this.icons, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<BmiProvider>(
        builder: (context, value, child) => Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icons!,
                Text(
                  text!,
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BodyMeasureConatainer
class WeightmeasureContainer extends StatelessWidget {
  final String? text;
  final String? text2;
  final VoidCallback addfunc;
  

   WeightmeasureContainer({super.key, this.text, this.text2, required this.addfunc  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                text2!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () => addfunc(),
                      icon: Icon(Icons.add_rounded),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {
                         Provider.of<BmiProvider>(context, listen: false).SubWeight();
                        },
                        icon: Icon(Icons.remove_rounded)),
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

// AgeMeasureContainer
class AgemeasureContainer extends StatelessWidget {
  final String? text;
  final String? text2;
   AgemeasureContainer({super.key, this.text, this.text2,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                text2!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () =>  Provider.of<BmiProvider>(context, listen: false).AddAge(),
                      icon: Icon(Icons.add_rounded),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    child: IconButton(
                        onPressed: () {
                          Provider.of<BmiProvider>(context, listen: false).SubAge();
                        },
                        icon: Icon(Icons.remove_rounded)),
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