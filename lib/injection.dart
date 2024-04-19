import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldesofttest/core/network/networkinfo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/usecases/getallcatg.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/usecases/getsubcatgor.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/repositories/Repositories.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/datasources/remotdatasource.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/datasources/localdatasource.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/repositories/repositoriesimp.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/bloc/bloc/bloc/getallcatgor_bloc.dart';



final sl = GetIt.instance;
Future<void> init() async {
//features items

//bloc 
  sl.registerFactory(() => GetallcatgorBloc(getallcatgorusecase: sl(), getallsubcatgorus: sl()));


//usecases
  sl.registerLazySingleton(() => Getallcatgorusecase(repositories: sl()));
 sl.registerLazySingleton(() => Getallsubcatgorusecase(repositories: sl()));

//repository
  sl.registerLazySingleton<Repositories>(() => Repositoriesimp(
        locadatasource: sl(),
        networkINFO: sl(),
        remotdatasource: sl(),
      ));
//datasources

  sl.registerLazySingleton<Locadatasource>(
      () => Locadatasourceim(sharedPreferences: sl()));
  sl.registerLazySingleton<Remotdatasource>(
      () => Remotdatasourceim(client: sl()));
      
//core
  sl.registerLazySingleton<NetworkINFO>(
      () => NetworkINFOimp(internetConnectionChecker: sl()));

//external

  final sharedPreferences =await SharedPreferences.getInstance();



  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
