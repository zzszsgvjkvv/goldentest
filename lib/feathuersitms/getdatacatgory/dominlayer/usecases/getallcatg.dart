import 'package:dartz/dartz.dart';
import 'package:goldesofttest/core/error/Faliuer.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/repositories/Repositories.dart';


class Getallcatgorusecase {
  final  Repositories repositories;

   Getallcatgorusecase({required this.repositories});
 Future<Either<Failuer, List<Entitesample>>> call() async {
    return await repositories.getallcatog();
  }
}



