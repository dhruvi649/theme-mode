import 'package:flutter/material.dart';
import 'package:plant_ui/provider/theme_provider.dart';
import 'package:plant_ui/screens/detail_screen.dart';
import 'package:plant_ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => MyTheme(),
        builder: (context, _) {
          final themeProvider = Provider.of<MyTheme>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: ThemeProvider.lightTheme,
            darkTheme: ThemeProvider.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            routes: {
              HomeScreen.id: (context) => const HomeScreen(),
              DetailScreen.id: (context) => const DetailScreen(),
            },
          );
        },
      );
}
