import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldesofttest/AppLocalizatons.dart';
import 'package:goldesofttest/core/conststreing/Constant.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/bloc/cubit/cubit/languagechange_cubit/languagechange_cubit.dart';

class MySettingspage extends StatefulWidget {
  const MySettingspage({super.key});

  @override
  State<MySettingspage> createState() => _MySettingspageState();
}

class _MySettingspageState extends State<MySettingspage> {
  String name = "sss";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizatons.of(context)!.translate('titleSettings')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizatons.of(context)!.translate('select you language'),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            BlocBuilder<LanguagechangeCubit, LanguagechangeState>(
                builder: (context, state) {
              if (state is Languagechange) {
                return DropdownButton<String>(
                    value: state.languagecode,
                    items: ['ar', 'en']
                        .map((String e) => DropdownMenuItem<String>(
                            value: e,
                            child: Row(
                              children: [
                                Text(
                                  langmap[e]!,
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            )))
                        .toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        BlocProvider.of<LanguagechangeCubit>(context)
                            .setlanguagecod(value);
                      }
                    });
              } else {
                return const SizedBox();
              }
            }),
            Text(
              AppLocalizatons.of(context)!.translate('select you them'),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ]),
        ));
  }
}
