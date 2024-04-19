import 'package:internet_connection_checker/internet_connection_checker.dart';



abstract class NetworkINFO{
  Future<bool> get isonline ;
}
class NetworkINFOimp implements NetworkINFO{
final InternetConnectionChecker internetConnectionChecker;

  NetworkINFOimp({required this.internetConnectionChecker});

  
  
  @override
 
  Future<bool> get isonline => internetConnectionChecker.hasConnection;

}