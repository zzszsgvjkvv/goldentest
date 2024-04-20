part of 'getallcatgor_bloc.dart';

sealed class GetallcatgorEvent extends Equatable {
  const GetallcatgorEvent();

  @override
  List<Object> get props => [];
}
class Gettallcatgor extends GetallcatgorEvent {


 const Gettallcatgor(); 
}

class RefrGettallcatg extends GetallcatgorEvent {
 final int id;

 const RefrGettallcatg({required this.id}); 
}
