import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';

class Mmodeldata extends Entitesample {
  const Mmodeldata({
    required super.id,
    required super.image,
    required super.name,
  });

  factory Mmodeldata.fromjson(Map<String, dynamic> json) {
    return Mmodeldata(id: json['id'], image: json["image"], name: json["name"]);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }
}
