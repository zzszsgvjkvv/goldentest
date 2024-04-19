import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:goldesofttest/injection.dart' as di;
import 'package:goldesofttest/AppLocalizatons.dart';
import 'package:goldesofttest/core/Them/Themappmeals.dart';
import 'package:goldesofttest/feathuersitms/auth/presentationlayer/pagesauth/authscreen.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/bloc/bloc/bloc/getallcatgor_bloc.dart';
import 'package:goldesofttest/feathuersitms/getdatacatgory/presentationlayer/bloc/cubit/cubit/languagechange_cubit/languagechange_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<GetallcatgorBloc>()..add(Gettallcatgor()),
          ),
          BlocProvider(
              create: (context) => LanguagechangeCubit()..getsavelanguagecod())
        ],
        child: BlocBuilder<LanguagechangeCubit, LanguagechangeState>(
          builder: (context, state) {
            if (state is Languagechange) {
              return MaterialApp(
                  locale: Locale(state.languagecode),
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  localeResolutionCallback: funlocaleResolutionCallback,
                  localizationsDelegates: localizationsDelegate,
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter testapp',
                  themeMode: ThemeMode.light,
                  theme: Appthem,
                  home: const AuthScreen());
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
