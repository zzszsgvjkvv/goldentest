import 'package:dartz/dartz.dart';
import 'package:goldesofttest/core/error/Faliuer.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';

abstract class Repositories {
  Future<Either<Failuer, List<Entitesample>>> getallcatog();
    Future<Either<Failuer, List<Entitesample>>> getallsubcatog(int id);

}
