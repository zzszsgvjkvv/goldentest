part of 'getallcatgor_bloc.dart';

sealed class GetallcatgorState extends Equatable {
  const GetallcatgorState();

  @override
  List<Object> get props => [];
}

final class GetallcatgorInitial extends GetallcatgorState {}

class Lodingstate extends GetallcatgorState {}

class Errorgetmealstate extends GetallcatgorState {
  final String mesg;

  const Errorgetmealstate({required this.mesg});
  @override
  List<Object> get props => [mesg];
}

class Lodedgstate extends GetallcatgorState {
  final List<Entitesample> modeldata;
  final List<Entitesample> submodeldata;
 final List<String> aded;
 p(String val) {
    bool isexisting = false;
    if (submodeldata != []) {
      isexisting = aded.contains(val);
    } else {
      isexisting = false;
    }
    if (isexisting) {
      aded.remove(val);
     
    } else {
      aded.add(val);
    }
  }
  const Lodedgstate( {
    required this.aded,
    required this.modeldata,
    required this.submodeldata,
    
  });
  @override
  List<Object> get props => [modeldata,submodeldata];
}
