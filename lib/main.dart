import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'lang_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? langCode = prefs.getString('language');
  runApp(
    ChangeNotifierProvider<LanguageProvider>(
      create: (_) => LanguageProvider()..fetchLocale(),
      child: MyApp(
        initialLocale: langCode != null ? Locale(langCode) : const Locale('ar'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  const MyApp({required this.initialLocale, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: 'Language App',
      locale: provider.appLocale,
      initialRoute: '/',
      routes: {'/': (context) => const HomeScreen()},
    );
  }
}
