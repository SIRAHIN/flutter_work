import 'package:go_route/pages/home_page.dart';
import 'package:go_route/pages/second_page.dart';
import 'package:go_route/pages/third_page.dart';
import 'package:go_router/go_router.dart';

class RoutesManager {
  static final routeConfig = GoRouter(routes: [
    GoRoute(
      name: '/',
      path: '/', 
      builder: (context, state) => const HomePage(),
    routes: [
       GoRoute(
        name: 'secondPage',
        path: 'secondPage/:name', 
        builder: (context, state) =>  SecondPage(name: state.pathParameters['name']!),
       
       routes: [
          GoRoute(
            name: 'thirdPage',
            path: 'thirdPage', 
            builder: (context, state) =>  ThirdPage()),
       ]
       ),
      //  GoRoute(path: 'thirdPage', builder: (context, state) => ThirdPage()),
    ]
    
    ),
    
  ]);
}
