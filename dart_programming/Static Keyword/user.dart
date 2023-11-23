class User{
  static String Uname = "Rahin";
  static String Upassword = "1234";

  static bool? Ulogin({required String Name, required String Password}){
    if(Uname == Name){
      if(Upassword == Password){
        
        return true;
        
        //return print("password match"); vlaue type of void can't return to bool type
      
      }
    }
    return false;
  } 
}