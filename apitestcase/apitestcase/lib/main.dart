import 'package:apitestcase/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, child) => 
      MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Consumer <MainProvider> (
            builder: (context, value, child) =>  Visibility(
              visible: value.visibility,
              replacement: Center(child: CircularProgressIndicator(),),
              child: ListView.builder(
                //shrinkWrap: true,
                itemCount: value.FeatchDataList.length,
                itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Container(
                      height: 100,
                      width:double.infinity,
                      color: Colors.deepPurple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${value.FeatchDataList[index].id}'),
                          Text('${value.FeatchDataList[index].author}'),
                          Text('body'),
                          Text('posted_at'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}