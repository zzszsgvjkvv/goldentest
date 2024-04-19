import 'package:dartz/dartz.dart';
import 'package:goldesofttest/core/error/Faliuer.dart';
import 'package:goldesofttest/core/error/exseption.dart';
import 'package:goldesofttest/core/network/networkinfo.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/models/model.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/repositories/Repositories.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/datasources/localdatasource.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/datasources/remotdatasource.dart';


typedef Addorediteordelete = Future<Unit> Function();

class Repositoriesimp implements Repositories {
  final Locadatasource locadatasource;
  final Remotdatasource remotdatasource;
  final NetworkINFO networkINFO;

 Repositoriesimp(
      {
        required this.locadatasource,
        required this.networkINFO,
      
      required this.remotdatasource, });



  @override
  Future<Either<Failuer, List<Mmodeldata>>> getallcatog() async{
    
  if (await networkINFO.isonline) {
      try {
        final postsdata = await remotdatasource.getalldata();
        await locadatasource.cacheddata(postsdata);
        return right(postsdata);
      } on ServerException {
        return left(Serverfailure());
      }
     
    } else {
      try {
        
        final postsmeals = await locadatasource.getcachdata();
      
        return right(postsmeals);
      } on EmptyException {
        return left(Emptycachefailure());
      }
     
    }
  }

  @override
  Future<Either<Failuer, List<Entitesample>>> getallsubcatog(int id) async{
    
   
  if (await networkINFO.isonline) {
      try {
        final postsdata = await remotdatasource.getallsubdata(id);
       
        return right(postsdata);
      } on ServerException {
        return left(Serverfailure());
      }
     
    } else {
     
      return left(Emptycachefailure());
  }
}}
