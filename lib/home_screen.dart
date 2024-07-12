import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_widget.dart';
import 'lang_data.dart';
import 'lang_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    String text1 = LangData.data[provider.appLocale.languageCode]!['text1']!;
    String text2 = LangData.data[provider.appLocale.languageCode]!['text2']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages App'),
        backgroundColor: const Color(0xFF587994),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          color: const Color(0xFFEBEBEB),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text(text1),
              Text(text2),
            ],
          ),
        ),
      ),
    );
  }
}
