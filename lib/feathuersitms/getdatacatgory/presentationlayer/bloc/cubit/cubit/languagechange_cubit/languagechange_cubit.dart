import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldesofttest/core/languagecach/languagecach.dart';


part 'languagechange_state.dart';

class LanguagechangeCubit extends Cubit<LanguagechangeState> {
  LanguagechangeCubit() : super(LanguagechangeInitial());
  Future<void> getsavelanguagecod() async{

    final languagecode=await Languagecahed().getlanguagecode();
    emit(Languagechange(languagecode: languagecode));
  }
  Future<void> setlanguagecod(String languagecode) async{
    await Languagecahed().cachelanguagecode(languagecode);
       emit(Languagechange(languagecode: languagecode));
  }
} 
