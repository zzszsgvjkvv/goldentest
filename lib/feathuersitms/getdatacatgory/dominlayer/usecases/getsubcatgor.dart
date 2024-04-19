import 'package:dartz/dartz.dart';
import 'package:goldesofttest/core/error/Faliuer.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/repositories/Repositories.dart';

class Getallsubcatgorusecase {
  final  Repositories repositories;

   Getallsubcatgorusecase({required this.repositories});
 Future<Either<Failuer, List<Entitesample>>> call(int id) async {
    return await repositories.getallsubcatog(id);
  }
}
