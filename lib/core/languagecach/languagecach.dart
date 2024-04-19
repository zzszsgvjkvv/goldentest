import 'package:shared_preferences/shared_preferences.dart';



class Languagecahed{
  final String _languagecach="languagecode";
Future<void> cachelanguagecode(String languagecode)async{
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString(_languagecach, languagecode);
}
Future<String> getlanguagecode()async{
  final SharedPreferences  sharedPreferences=await SharedPreferences.getInstance();
 final String? languagecode=sharedPreferences.getString(_languagecach);
  if(languagecode !=null){
return languagecode;
  }
else{
  return "en";
}
}
}
