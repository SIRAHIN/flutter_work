
import 'package:flutter/material.dart';
import 'package:notetakingapp/repositoris/tasktaking_repositoris.dart';



//enumfor PopUp
enum Option {
  delete,
  update,
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _bodyEditiingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('T Taking App'),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: TaskTakingRepositoris.getNots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(18.0)),
                    //margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(10.0),
                    height: 90,
                    width: double.infinity,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.docs[index]['title'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(snapshot.data!.docs[index]['body'],
                                style: const TextStyle(
                                    fontSize: 19, color: Colors.grey))
                          ],
                        ),

                        // IconButton(onPressed: () {
                        //   return deleteNote(snapshot.data!.docs[index].id);
                        // }, icon: Icon(Icons.delete,color: Colors.amberAccent,))

                        PopupMenuButton<Option>(
                          color: Colors.orangeAccent,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text('Delete'),
                              value: Option.delete,
                            ),
                            PopupMenuItem(
                              child: Text('Update'),
                              value: Option.update,
                            ),
                          ],
                          onSelected: (value) {
                            if (value == Option.delete) {
                              TaskTakingRepositoris.deleteNote(snapshot.data!.docs[index].id);
                            }
                            if (value == Option.update) {
                              _titleEditingController.text = snapshot.data!.docs[index]['title'];
                              _bodyEditiingController.text = snapshot.data!.docs[index]['body'];
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  height: 400,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          "Update Notes",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextField(
                                          controller: _titleEditingController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            hintText: 'Title Note',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextField(
                                          controller: _bodyEditiingController,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            hintText: 'Body Note',
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            if(_titleEditingController.text.isEmpty || _bodyEditiingController.text.isEmpty){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Missing item!!'))
                                              );
                                            }
                                           else { TaskTakingRepositoris.updateNote(snapshot.data!.docs[index].id, _titleEditingController.text, _bodyEditiingController.text);
                                           
                                            _titleEditingController.clear();
                                            _bodyEditiingController.clear();
                                           }
                                          }, 
                                          child: const Text("Update Note"),),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _titleEditingController.clear();
          _bodyEditiingController.clear();
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Ola..!",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _titleEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        hintText: 'Title Note',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _bodyEditiingController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        hintText: 'Body Note',
                      ),
                    ),
                  ),
                  ElevatedButton(

                      onPressed: () => TaskTakingRepositoris.saveNote(context: context, 
                      TitleText:  _titleEditingController.text, 
                      bodyText: _bodyEditiingController.text),

                      child: const Text("Save note"))
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
