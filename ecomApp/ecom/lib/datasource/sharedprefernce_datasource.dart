import 'package:ecom/core/constaints/sharedPreferences_tokenKey.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSource{

  late SharedPreferences _preferences;

  SharedPreferencesDataSource(this._preferences);

 //Save token Function
   Future <bool> saveToken({required String value}){
    return _preferences.setString(SharedPreferencesTokenKey.tokenkey, value);
  }

  //Get Token Function
  Future<String?> getToken() async {
    return await _preferences.getString(SharedPreferencesTokenKey.tokenkey);
  }

  //Delete Token Function
  Future <bool> deleteToken(){
    return _preferences.remove(SharedPreferencesTokenKey.tokenkey);
  }

}