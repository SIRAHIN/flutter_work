import 'package:bottweet/data/bottweet_data_source.dart';
import 'package:bottweet/model/bot_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {


   HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  TextEditingController nameInput = TextEditingController();
  TextEditingController TweetInput = TextEditingController();


void postdata ({required String author, required String body})async {
  http.Response post = await http.post(Uri.parse("https://64a016efed3c41bdd7a6fbaf.mockapi.io/bottweet"),
  body: {
    "author": "$author",
    "body": "$body",
  }
  ) ;

}
 

  @override
  Widget build(BuildContext context) {
    // Future <List?> bottweetpost =  BotTweetDataSource.getAllpost();

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              setState(() {
                
              });
            }, icon: Icon(Icons.replay_outlined))
          ],
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text(
            'B O T T w e e t',
            style: TextStyle(fontSize: 22, fontFamily: 'Urbanist'),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: BotTweetDataSource.getAllpost(),
          builder: (context, snapshot) {
           // if(snapshot.connectionState == ConnectionState.waiting)

            if (snapshot.hasError) {
              return  Text("Error found");
            }
            if (snapshot.hasData) {
              List<BotModel>? datalist = snapshot.data;
              return ListView.builder(
                //itemCount: snapshot.data!.length,
                itemCount: datalist!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://i.pravatar.cc/300'),
                    ),
                    title: Text("${datalist[index].author}"),
                    subtitle: Text("${snapshot.data![index].body}"),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        //ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) =>  Padding(
        //     padding: const EdgeInsets.symmetric(vertical:10.0),
        //     child: ListTile(
        //       leading: const CircleAvatar(
        //         backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
        //       ),
        //       title: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: const [
        //           Text("Kyklos",style:  TextStyle(fontSize: 20, fontFamily: 'Urbanist', fontWeight: FontWeight.bold),),
        //           Text("2023-07-01T03:13:30.221Z", style:  TextStyle(fontSize: 14, fontFamily: 'Urbanist', fontWeight: FontWeight.bold),)
        //         ],
        //       ),
        //       subtitle: const Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing.", style: TextStyle(fontWeight: FontWeight.bold),),
        //     ),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) =>  Container(
                
                height: 600,
                child: Column(
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: nameInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                          labelText: "Name"
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: TweetInput,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                          labelText: "Your Tweet"
                        ),
                      ),
                    ),
                     ElevatedButton(
                      onPressed: () {
                        if (nameInput.text.isNotEmpty || TweetInput.text.isNotEmpty) {
                          // BotTweetDataSource.PostBotTweet(BotModel(author: author, body: body));
                          // postdata(author: author, body: body)
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please write something')));
                        }
                      },
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
        ));
  }
}

