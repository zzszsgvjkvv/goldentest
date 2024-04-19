part of 'languagechange_cubit.dart';

sealed class LanguagechangeState extends Equatable {
  const LanguagechangeState();

  @override
  List<Object> get props => [];
}

final class LanguagechangeInitial extends LanguagechangeState {}
final class Languagechange extends LanguagechangeState{
final String languagecode;

  const Languagechange({required this.languagecode});
    @override
  List<Object> get props => [languagecode];
}
