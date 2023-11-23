import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/datasource/sharedprefernce_datasource.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthMiddleWare{
   static Future <String?> guardWithLogin() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    // String? token = sharedPreferences.getString(SharedPreferencesTokenKey.tokenkey);
    // //

    SharedPreferencesDataSource sharedPreferencesDataSource = SharedPreferencesDataSource(sharedPreferences);
    String? token = await sharedPreferencesDataSource.getToken();

    //if token is null the go Route to loginPage  -- or initially will show base route like mainPage.
    if(token == null){
      return RoutesName.loginPage;

    //Else no effect on routing working on sub routing --- Like Details Page
    }
    return null;
  }
  
}