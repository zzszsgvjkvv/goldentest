import 'package:goldesofttest/feathuersitms/auth/Domain/entites/authentites.dart';

class Modelauth extends Entitesampleauth {
  Modelauth(
      {required super.name,
      required super.email,
      required super.password,
      required super.city,
      required super.latitude,
      required super.longitude,
      required super.residency_photo,
      required super.bank_name,
      required super.sub_categories,
      required super.code,
      required super.iban,
      required super.phone});
    //  Modelauth.fromjson  Map<String, dynamic> tojson() no use
  factory Modelauth.fromjson(Map<String, dynamic> json) {
    return Modelauth(
        phone: json[''],
        email: json[''],
        name: json[''],
        city:json[''],
        password: json[''],
        latitude: json[''],
        longitude: json[''],
        residency_photo: json[''],
        bank_name:json[''],
        sub_categories: json[''],
        code:json[''],
        iban: json['']);
  }
  Map<String, dynamic> tojson() {
    return {
      
    };
  }
}
