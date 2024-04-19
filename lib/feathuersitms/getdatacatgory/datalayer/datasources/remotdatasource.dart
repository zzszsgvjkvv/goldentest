import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:goldesofttest/core/error/exseption.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/datalayer/models/model.dart';

abstract class Remotdatasource {
  Future<List<Mmodeldata>> getalldata();
   Future<List<Mmodeldata>> getallsubdata(int id);
}
                        


class Remotdatasourceim extends Remotdatasource {
  final http.Client client;

  Remotdatasourceim({required this.client});

  @override
  Future<List<Mmodeldata>> getalldata() async {
    const String baseurl = 'https://qondos.net/api/categories';
    final response = await http.get(
        Uri.parse(baseurl),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final decodejson = json.decode(response.body);
      final List datarespon = decodejson['data'];

      List<Mmodeldata> postmeals = datarespon
          .map<Mmodeldata>((postmeal) => Mmodeldata.fromjson(postmeal))
          .toList();
     
      return postmeals;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<List<Mmodeldata>> getallsubdata(int id) async{
    const String baseurl = 'https://qondos.net/api/categories';
     final response = await http.get(
        Uri.parse("$baseurl/$id"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final decodejson = json.decode(response.body);
      final List datarespon = decodejson['data'];

      List<Mmodeldata> postmeals = datarespon
          .map<Mmodeldata>((postmeal) => Mmodeldata.fromjson(postmeal))
          .toList();
     
      return postmeals;
    } else {
      throw ServerException();
    }
  }
  
  }

