import 'package:equatable/equatable.dart';

class Entitesample extends Equatable{
 final int id ;
 final String image;
 final Map<String,dynamic>name;

  const Entitesample( {required this.id,required this.image,required  this.name,});
  @override
  
  List<Object?> get props => [id];

}


