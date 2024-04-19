import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:goldesofttest/core/error/exseption.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/models/model.dart';



abstract class Locadatasource {
  Future<List<Mmodeldata>> getcachdata();
  Future<Unit> cacheddata(List<Mmodeldata> listdata);

}
 const String _cachmeal = "cachdata";
  const String _subcachmeal = "subcachdata";
class Locadatasourceim implements Locadatasource {

  final SharedPreferences sharedPreferences;

  Locadatasourceim({required this.sharedPreferences});
  
  @override
  Future<Unit> cacheddata(List<Mmodeldata> cachdata) {
    
   
  List postmealjson = cachdata
        .map<Map<String, dynamic>>((Postmeale) => Postmeale.tojson())
        .toList();

    sharedPreferences.setString(_cachmeal, json.encode(postmealjson));
    return Future.value(unit);
  }
  
  @override
  Future<List<Mmodeldata>> getcachdata() {
  final jsonstring = sharedPreferences.getString(_cachmeal);
    if (jsonstring != null) {
      List decodejsonstring = json.decode(jsonstring);
      List<Mmodeldata> jsontopostmodel = decodejsonstring
          .map<Mmodeldata>((postmodelmeal) => Mmodeldata.fromjson(postmodelmeal))
          .toList();
      return Future.value(jsontopostmodel);
    } else {
      throw EmptyException();
    }
  }
  }
  /*
  @override
  Future<Unit> cachedsubdata(List<Mmodeldata> cachdata) {
    
   
 
  List postmealjson = cachdata
        .map<Map<String, dynamic>>((Postmeale) => Postmeale.tojson())
        .toList();

    sharedPreferences.setString(_cachmeal, json.encode(postmealjson));
    return Future.value(unit);
  }
  
  @override
  Future<List<Mmodeldata>> getcasubchdata() {
  final jsonstring = sharedPreferences.getString(_cachmeal);
    if (jsonstring != null) {
      List decodejsonstring = json.decode(jsonstring);
      List<Mmodeldata> jsontopostmodel = decodejsonstring
          .map<Mmodeldata>((postmodelmeal) => Mmodeldata.fromjson(postmodelmeal))
          .toList();
      return Future.value(jsontopostmodel);
    } else {
      throw EmptyException();
    }
  }
  

  }*/
  
 
 

 