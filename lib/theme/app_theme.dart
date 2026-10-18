import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.blue),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black54,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.orangeAccent, width: 3),
      ),
    ),
   iconTheme: const IconThemeData(color: Colors.lightBlue),
   navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.black,
    indicatorColor: Colors.greenAccent.shade100,
    iconTheme: WidgetStateProperty.resolveWith((states) {
     return IconThemeData(
      color: states.contains(WidgetState.selected)
          ? Colors.black
          : Colors.greenAccent,
     );
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
     return TextStyle(
      color: states.contains(WidgetState.selected)
          ? Colors.black
          : Colors.greenAccent,
     );
    }),
   ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF032E6D),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.yellow,
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.cyan,
      textColor: Colors.blueGrey,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF032E6D),
        foregroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
   cardTheme: CardThemeData(
    color: Colors.black12,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.white30,
    elevation: 4,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(20),
     side: const BorderSide(color: Colors.greenAccent, width: 3),
    ),
   ),
   iconTheme: const IconThemeData(color: Colors.deepPurple),
   navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: Colors.deepPurple.shade100,
    iconTheme: WidgetStateProperty.resolveWith((states) {
     return IconThemeData(
      color: states.contains(WidgetState.selected)
          ? Colors.deepPurple
          : Colors.grey,
     );
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
     return TextStyle(
      color: states.contains(WidgetState.selected)
          ? Colors.deepPurple
          : Colors.grey,
     );
    }),
   ),
  );
}
