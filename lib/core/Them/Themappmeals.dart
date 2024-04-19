import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

var mycolorscem =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 79, 33, 206));
final Appthem = ThemeData().copyWith(
    scaffoldBackgroundColor: mycolorscem.primary.withOpacity(0.5),
    colorScheme: mycolorscem,
    applyElevationOverlayColor: true,
   
     bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      elevation: 5,
      backgroundColor:mycolorscem.primary,
      selectedLabelStyle: TextStyle().copyWith(
         color:    mycolorscem.primary,
         fontSize: 16
      ),
    
      selectedIconTheme: IconThemeData().copyWith(
       color:    mycolorscem.primaryContainer,
       size: 25,

      ),
      unselectedIconTheme: IconThemeData().copyWith(
       color:    mycolorscem.primaryContainer,
       size: 20
      ), 
      unselectedLabelStyle: TextStyle().copyWith( color:    mycolorscem.onPrimaryContainer,
         fontSize:10)
    ),
    drawerTheme: DrawerThemeData().copyWith(backgroundColor:mycolorscem.primaryContainer),
    appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: mycolorscem.onPrimaryContainer,
        foregroundColor: mycolorscem.primaryContainer
        ),
    cardTheme: const CardTheme().copyWith(
        elevation: 2,
        color: mycolorscem.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: mycolorscem.primaryContainer),
    ),
    textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: mycolorscem.onSecondaryContainer)));

var mycolorscemdak =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 251, 54, 54));
final Appthemdark = ThemeData().copyWith(
    colorScheme: mycolorscemdak,
    applyElevationOverlayColor: true,
  
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      elevation: 5,
      selectedLabelStyle: TextStyle().copyWith(
         color:    mycolorscem.primaryContainer,
         fontSize: 16
      ),
      backgroundColor:  mycolorscem.onPrimaryContainer,
      selectedIconTheme: IconThemeData().copyWith(
       color:    mycolorscem.primaryContainer,
       size: 30,

      ),
      unselectedIconTheme: IconThemeData().copyWith(
       color:    mycolorscem.primaryContainer,
       size: 24
      ), 
      unselectedLabelStyle: TextStyle().copyWith( color:    mycolorscem.onPrimaryContainer,
         fontSize: 12)
    ),
  
    appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: mycolorscemdak.onPrimaryContainer,
        foregroundColor: mycolorscemdak.primaryContainer),
    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      backgroundColor: mycolorscemdak.onPrimaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
        elevation: 2,
        color: mycolorscemdak.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: mycolorscemdak.onPrimary,
          backgroundColor: mycolorscemdak.primaryContainer),
    ),
    textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: mycolorscemdak.onSecondaryContainer)));
