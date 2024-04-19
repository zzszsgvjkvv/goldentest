import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:goldesofttest/core/error/mesg.dart';
import 'package:goldesofttest/core/error/Faliuer.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/usecases/getallcatg.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/usecases/getsubcatgor.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';

part 'getallcatgor_event.dart';
part 'getallcatgor_state.dart';

class GetallcatgorBloc extends Bloc<GetallcatgorEvent, GetallcatgorState> {
  final Getallcatgorusecase getallcatgorusecase;
    final Getallsubcatgorusecase getallsubcatgorus;
  GetallcatgorBloc( {required this.getallcatgorusecase,required this.getallsubcatgorus,})
      : super(GetallcatgorInitial()) {
    on<GetallcatgorEvent>((event, emit) async {
    
      if (event is RefrGettallcatg) {
      emit(Lodingstate());
        final datasorfail = await getallcatgorusecase();
    final subdatasorfail = await    getallsubcatgorus(event.id);

        emit(fuErrorLodedgstate(datasorfail,subdatasorfail));
      }
      else  if (event is Gettallcatgor) {
        emit(Lodingstate());
        final datasorfail = await getallcatgorusecase();
    final subdatasorfail = await    getallsubcatgorus(4);

        emit(fuErrorLodedgstate(datasorfail,subdatasorfail));
      }
    });
  }

  String _mesgfailure(Failuer failuer) {
    switch (failuer.runtimeType) {
      case Serverfailure:
        return Messg.ServerException.name;

      case Offlinefailure:
        return Messg.EmptyException.name;

      case Emptycachefailure:
        return Messg.WorndataException.name;

      default:
        return "unexpected please error try again...";
    }
  }
List<Entitesample> subdatasorfail(Either<Failuer, List<Entitesample>>subdatas){
 return subdatas.fold((failuer){
     return [];
  }, (listdat){
    return listdat;
  });


}
  GetallcatgorState fuErrorLodedgstate(
      Either<Failuer, List<Entitesample>> either, Either<Failuer, List<Entitesample>> subdatasorfal) {
    return either.fold((failuer) {
  
      return Errorgetmealstate(mesg: _mesgfailure(failuer));
    }, (listdatacatgory) {
     
      return Lodedgstate(modeldata: listdatacatgory, submodeldata:subdatasorfail(subdatasorfal), aded: []);
    });
  }
  
}
