import 'package:all_widget/page/Favorite_page.dart';
import 'package:all_widget/page/main_home_page.dart';
import 'package:all_widget/page/message_page.dart';
import 'package:all_widget/page/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> datalist = ['01', '02', '03', '04'];
  int count = 0;
  final _NameController = TextEditingController();
  final _PassWordController = TextEditingController();

  String ShowName = '';
  String ShowPassword = '';

  bool PassWord = true;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              keyboardType: TextInputType.name,
              enableSuggestions: true,
              controller: _NameController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      _NameController.clear();
                    },
                    icon: Icon(Icons.clear_outlined)),
                labelText: "Name",
                hintText: "Enter your Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _PassWordController,
              obscureText: PassWord,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                    PassWord = !PassWord;
                  });
                }, icon: Icon(
                  PassWord
                  ? Icons.visibility
                  : Icons.visibility_off
                )),
                hintText: "Enter your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ShowName = _NameController.text;
                  ShowPassword = _PassWordController.text;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: 80,
                  height: 40,
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("Post")),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(ShowName),
                  Text(ShowPassword),
                ],
              ),
            )
          ],
        ),
      ),

//________________________________________________________________________________________//
      /** Sliver APP BAR **/
      // backgroundColor: Colors.deepPurple[200],
      // body:CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       leading: Icon(Icons.menu),
      //       //title: Text("SLIVER APP BAR"),
      //       centerTitle: true,
      //       expandedHeight: 200,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text("Expended From"),
      //         centerTitle: true,
      //         background: Container(
      //           color: Colors.deepPurple,
      //         ),
      //       ),
      //     ),

      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20.0),
      //           child: Container(
      //             height: 300,
      //             width: 300,
      //             color: Colors.purpleAccent,
      //           ),
      //         ),
      //       ),
      //     ),

      //      SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20.0),
      //           child: Container(
      //             height: 300,
      //             width: 300,
      //             color: Colors.purpleAccent,
      //           ),
      //         ),
      //       ),
      //     ),

      //      SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(20.0),
      //           child: Container(
      //             height: 300,
      //             width: 300,
      //             color: Colors.purpleAccent,
      //           ),
      //         ),
      //       ),
      //     )

      //   ],
      // ),

      //________________________________________________________________________________________//
      /** GestureDetector - with setstate **/
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //         Text("Tapped ${count} time", style: TextStyle(
      //           fontSize: 20.0
      //         ),),
      //         ClipRRect(
      //           borderRadius: BorderRadius.circular(16.0),
      //           child: Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.deepPurple,
      //             child:Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     count = count+1;
      //                     // if(count == 11){
      //                     //   setState(() {
      //                     //     count = 0;
      //                     //   });
      //                     // }
      //                   });
      //                 },
      //                 child: Center(
      //                   child: Text("TAP Here",
      //                   style: TextStyle(
      //                     fontSize: 20.0
      //                   ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               count = 0;
      //             });
      //           },
      //           child: Container(
      //             color: Colors.amberAccent,
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text("Reset", style: TextStyle(fontSize: 20.0),),
      //             ),

      //           ),
      //         )
      //     ],
      //   ),
      // )

      /** D R A W E R **/
      // appBar: AppBar(
      //   title: Text("D R A W E R"),
      //   centerTitle: true,
      //   backgroundColor: Colors.amber[500],
      // ),
      // drawer: Drawer(
      //   backgroundColor: Colors.amber[200],
      //   child:  ListView(
      //       children:  [
      //         const DrawerHeader(
      //           child: Center(child: Text("DrawerHeader")),
      //         ),

      //         ListTile(
      //           leading: const Icon(Icons.person),
      //           title: const Text("Person Table"),
      //           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(),),),
      //         ),

      //          ListTile(
      //           leading: const Icon(Icons.favorite_outline_rounded),
      //           title: Text("Favorite Table"),
      //           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavoritePage(),),) ,
      //         ),
      //       ],
      //   ),
      // ),

      //________________________________________________________________________________________//

      /** BottomNavigatorButton With Page Route **/

      // List <Widget> Pages =[
      //   MainHomePage(),
      //   MessagePage(),
      //   FavoritePage(),
      //   ProfilePage(),
      // ];

      // int selectedIndex = 0;

      // void getIndex(int index){
      //   setState(() {
      //     selectedIndex = index;
      //   });
      // }

      //Pages[selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedIndex,
      //   onTap: getIndex,
      //   type: BottomNavigationBarType.fixed,
      //   items:  const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: "Favorite"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ]
      // ),

      //________________________________________________________________________________________//

      /** List View Builder With List Title */
      // Container(
      //   child: ListView.builder(
      //     itemCount: datalist.length,
      //     itemBuilder: (context, index) => ListTile(
      //       leading: CircleAvatar(
      //         child: Text(
      //           index.toString(),
      //         ),
      //       ),
      //       title: Text("List view Builder"),
      //       subtitle: Text("Supper xoss"),
      //       trailing: Icon(Icons.edit),
      //       shape: Border.all(
      //         color: Colors.grey,
      //         width: 1.0
      //       )
      //     ),
      //   ),
      // ),

      //________________________________________________________________________________________//

      /** For Row - Cross represent vertical **/
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: 50,
      //       width: 100,
      //       color: Colors.amber[500],
      //     ),

      //     Container(
      //       height: 100,
      //       width: 120,
      //       color: Colors.amber[200],
      //     ),

      //     Container(
      //       height: 200,
      //       width: 140,
      //       color: Colors.amber[700],
      //     ),
      //   ]
      // )

      //________________________________________________________________________________________//

      /** For column - Cross represent horizontal **/
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Container(
      //       height: 200,
      //       width: 300,
      //       color: Colors.amber[500],
      //     ),

      //     Container(
      //       height: 200,
      //       width: 200,
      //       color: Colors.amber[200],
      //     ),

      //     Container(
      //       height: 200,
      //       width: 250,
      //       color: Colors.amber[700],
      //     ),
      //   ],
      // ),

      //________________________________________________________________________________________//

      //* -- Container Practice -- *//
      //Center(
      // child: Container(
      //   alignment: Alignment.center,
      //   height: 150,
      //   width: 150,
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     shape: BoxShape.circle,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.green,
      //         blurRadius: 25.0,
      //         offset: Offset(4.0, 4.0),
      //         spreadRadius: 1.0
      //       ),

      //         BoxShadow(
      //         color: Colors.white,
      //         blurRadius: 25.0,
      //         offset: Offset(-4.0, -4.0),
      //         spreadRadius: 1.0
      //       )
      //     ]
      //   ),
      //   child: const Text("Container"),
      // ),
    );
  }
}
