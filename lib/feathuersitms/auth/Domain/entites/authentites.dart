import 'package:equatable/equatable.dart';

class Entitesampleauth extends Equatable {
  final String name,
      email,
      password,
      city,
      latitude,
      longitude,
      residency_photo,
      bank_name,
      sub_categories,
      code;
  final int iban, phone;

  Entitesampleauth({required this.name, required this.email, required this.password, required this.city, required this.latitude, required this.longitude, required this.residency_photo, required this.bank_name, required this.sub_categories, required this.code, required this.iban, required this.phone});



  @override
  List<Object?> get props => [
        name,
        email,
        password,
        city,
        latitude,
        longitude,
        residency_photo,
        bank_name,
        sub_categories,
        code,
        iban,
        phone
      ];
}
