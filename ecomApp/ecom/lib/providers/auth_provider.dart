import 'dart:convert';

import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/datasource/sharedprefernce_datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constaints/sharedPreferences_tokenKey.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  bool hasError = false;
  String ErrorMsg = '';

                    //formstate key passing by fuction parameter here
  Future<bool> login(GlobalKey<FormState> formKey, String username,String password,) async {
      
      ErrorMsg = '';
      notifyListeners();
      
    //form input validation test
    if (formKey.currentState!.validate()) {
    
    // if inputs are match with validation then loading will execute and error msg shows empty.
      isLoading = true;
      ErrorMsg = '';
      notifyListeners();

      http.Response response = await http.post(
          Uri.parse('https://fakestoreapi.com/auth/login'),
          body: {"username": username, "password": password});
          
  
      if (response.statusCode == 401) {

        // if as error CircularProgressIndicator will stop execute 
        isLoading = false;
        hasError = true;
        ErrorMsg = 'username or password is incorrect';
        notifyListeners();

        return false;
        // final snackBar =
        //     SnackBar(content: Text('emailaddress or password is incorrect'));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      

      if (response.statusCode == 200)  {

         // if has data CircularProgressIndicator will stop execute.
        isLoading = false;
        ErrorMsg = '';
        notifyListeners();

        //Token Body decode here to pass saveTOken below---->
        var token = jsonDecode(response.body)['token'];

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        // bool isTokenSave = await sharedPreferences.setString(SharedPreferencesTokenKey.tokenkey, token);

        SharedPreferencesDataSource sharedPreferencesDataSource = SharedPreferencesDataSource(sharedPreferences);

        //Calling Function to pass token value
        return sharedPreferencesDataSource.saveToken(value: token);

        //return isTokenSave;
        // final snackBar = SnackBar(content: Text('Login Successfully'));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return false;
   
  }
}
