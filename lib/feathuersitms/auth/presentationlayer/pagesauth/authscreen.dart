import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goldesofttest/AppLocalizatons.dart';
import 'package:goldesofttest/feathuersitms/auth/presentationlayer/imagpicerselect.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/dominlayer/Etities/Entitepostmeal.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/pages/settingpage.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/widgets/lodingwidget.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/maplocation/maploction.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/widgets/Errorgetmealstatewidget.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/bloc/bloc/bloc/getallcatgor_bloc.dart';


final firebaseAuth = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late File imagepic;
  List<String> aded = [];
 late double x;
 late double y;
 late double latitude;
   late double        longitude;
  final GlobalKey<FormState> formke = GlobalKey();
  bool che = false;

  @override
  Widget build(BuildContext context) {
    late String usename, email, password, namepank, cityname;
    late int pancknumber, mobilenumber;
    String? mainitmslect;

    Widget subcategories(BuildContext context) {
      return Column(children: [
        BlocBuilder<GetallcatgorBloc, GetallcatgorState>(
          builder: (context, state) {
             if (state is Errorgetmealstate) {
              return Errorgetmealstatewidget(mesg: state.mesg);
            } else if (state is Lodedgstate) {
              final List<Entitesample> category = state.modeldata;

              return SizedBox(
                child: DropdownButtonFormField<String>(
                    value: mainitmslect,
                    onSaved: (newValue) {},
                    hint: Text(AppLocalizatons.of(context)!
                        .translate("mainselecttyou")),
                    items: category
                        .map((e) => DropdownMenuItem<String>(
                            onTap: () {
                              mainitmslect = e.name[AppLocalizatons.of(context)!
                                  .translate('languageCode')];

                              BlocProvider.of<GetallcatgorBloc>(context)
                                  .add(RefrGettallcatg(id: e.id));
                            },
                            value: e.name[AppLocalizatons.of(context)!
                                .translate('languageCode')],
                            child: Row(
                              children: [
                                Text(e.name[AppLocalizatons.of(context)!
                                    .translate('languageCode')]!)
                              ],
                            )))
                        .toList(),
                    onChanged: (String? value) {
                      if (value != null) {}
                    }),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 5,
        ),
        BlocBuilder<GetallcatgorBloc, GetallcatgorState>(
          builder: (context, state) {
            if (state is Lodingstate) {
              return const Lodingstatwidget();
            } else if (state is Errorgetmealstate) {
              return Errorgetmealstatewidget(mesg: state.mesg);
            } else if (state is Lodedgstate) {
              final List<Entitesample> subcategory = state.submodeldata;
              return DropdownButtonFormField<String>(
                  hint: Text(
                      AppLocalizatons.of(context)!.translate("selecttyou")),
                  items: subcategory
                      .map((e) => DropdownMenuItem<String>(
                          value: e.name[AppLocalizatons.of(context)!
                              .translate('languageCode')],
                          child: Row(
                            children: [
                              Checkbox(
                                value: state.aded.contains(e.name[
                                    AppLocalizatons.of(context)!
                                        .translate('languageCode')]),
                                onChanged: (value) {
                                  Navigator.pop(context);
                                  setState(() {
                                    state.p(e.name[AppLocalizatons.of(context)!
                                        .translate('languageCode')]);
                                  });
                                },
                              ),
                              Text(e.name[AppLocalizatons.of(context)!
                                  .translate('languageCode')])
                            ],
                          )))
                      .toList(),
                  onChanged: (String? value) {
                    if (value != null) {}
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ]);
    }

    Future<void> registerwithfile(
        String url, File file, List<String> subCategorie) async {
  
      if (formke.currentState!.validate()) {
        formke.currentState!.save();

        Map map = {
          "sub_categories": subCategorie.toString(),
          'phone': mobilenumber.toString(),
          'email': email.toString(),
          'name': usename.toString(),
          'city': cityname,
          'password': password.toString(),
          ' latitude': latitude.toString(),
          'longitude':longitude.toString(),
          'bank_name': namepank,
          'iban': pancknumber.toString(),
        };

       print(map);
        var reqest = await http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );
        var length = (await file.length());
        var strem = http.ByteStream(file.openRead());
        var name = basename(file.path);
        var multparfile =
            http.MultipartFile('residency_photo', strem, length, filename: name);
        reqest.files.add(multparfile);

        map.forEach((key, val) {
          reqest.fields[key] = val;
        });
        var myreqest = await reqest.send();
        var respose = await http.Response.fromStream(myreqest);
        if (myreqest.statusCode == 200) {
          return json.decode(respose.body);
        } else {
          print("dddddddddddddddddddddd");
          print(myreqest.statusCode);
          print(map);
        }
      } else {
        print("object");
      }
    }

    Widget themTextform(
        {required String lable,
        required Icon icon,
        required String? Function(String? val) validator,
        required void Function(String?) saved}) {
      return TextFormField(
        onSaved: saved,
        validator: validator,
        decoration: InputDecoration(
          label: Text(lable),
          suffix: icon,
        ),
      );
    }

    Widget _buildbody(BuildContext context) {
      return Center(
          child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: Form(
                  key: formke,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                SizedBox(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizatons.of(context)!
                                          .translate('register'),
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      AppLocalizatons.of(context)!
                                          .translate('newregister'),
                                      style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          fontSize: 24,
                                          color: Color.fromARGB(
                                              255, 239, 117, 108)),
                                    ),
                                  ],
                                )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MySettingspage(),
                                            ));
                                      },
                                      icon: const Icon(Icons.settings)),
                                ),
                                Imagepickerselect(onpicimage: (File picimagr) {
                                  imagepic = picimagr;
                                }),
                                //  Maploction(),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('usename'),
                                    icon: const Icon(Icons.person),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      usename = valnew!;
                                    }),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('mobilenumber'),
                                    icon: const Icon(Icons.mobile_friendly),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      mobilenumber = int.parse(valnew!);
                                    }),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('email'),
                                    icon: const Icon(Icons.email),
                                    validator: (value) {
                                      return null;
                                    },
                                    saved: (valnew) {
                                      email = valnew!;
                                    }),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('password'),
                                    icon: const Icon(Icons.password),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      password = valnew!;
                                    }),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('cityname'),
                                    icon: const Icon(Icons.location_city),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      cityname = valnew!;
                                    }),
                                subcategories(context),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('panckname'),
                                    icon: const Icon(Icons.money),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      namepank = valnew!;
                                    }),
                                themTextform(
                                    lable: AppLocalizatons.of(context)!
                                        .translate('pancknumber'),
                                    icon: const Icon(Icons.numbers),
                                    validator: (value) {
                                      if (value != null &&
                                          value.trim().isNotEmpty) {
                                        return null;
                                      } else {
                                        return "eror input";
                                      }
                                    },
                                    saved: (valnew) {
                                      pancknumber = int.parse(valnew!);
                                    }),
                                const SizedBox(height: 20),
                               
                                SizedBox(
                                  height: 20,
                                ),
                         
                                
                                TextButton(
                                    onPressed: ()async {
                                    await  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Maploction(location: (double x, double y) {
                                              latitude=x;
                                              longitude=y;
                                              print(latitude);
                                              print(longitude);
                                              },),
                                          ));
                                    },
                                    child: Text("تحديد الموقع على الخريطة")),
                                BlocBuilder<GetallcatgorBloc,
                                GetallcatgorState>(
                                 builder: (context, state) {
                                if (state is Lodedgstate) {
                                  return InkWell(
                                        onTap: () async {
                                              formke.currentState!.validate();
                                          await registerwithfile(
                                              "https://qondos.net/api/technicans/sign-up",
                                              imagepic,
                                              state.aded);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          color: Theme.of(context).primaryColor,
                                          child: Center(
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              AppLocalizatons.of(context)!
                                                  .translate("newregister"),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                )
                              ])))))));
    }

    return SafeArea(
        child: Scaffold(
      body: _buildbody(context),
    ));
  }
}
