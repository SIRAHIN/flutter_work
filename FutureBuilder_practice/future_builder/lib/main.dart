import 'package:flutter/material.dart';

import 'datasource/bot_model_ds.dart';
import 'model/bot_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: FutureBuilder(
          future: BotModelDs.getallpost(),
          builder: (context, snapshot) {
            List<BotApi>? datalist = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: datalist!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text("${datalist[index].id}"),
                  title: Text("${datalist[index].author}"),
                  subtitle: Text('${datalist[index].body}'),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        // controller: nameInput,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0))),
                            labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        // controller: TweetInput,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0))),
                            labelText: "Your Tweet"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "POST",
                        style: TextStyle(fontFamily: 'Urbanist'),
                      ),
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
