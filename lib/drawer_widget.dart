import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lang_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF512D4F),
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to settings screen if needed
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Language'),
              value: provider.appLocale.languageCode,
              onChanged: (String? newValue) {
                if (newValue == 'en') {
                  provider.changeLanguage(const Locale('en'));
                } else if (newValue == 'ar') {
                  provider.changeLanguage(const Locale('ar'));
                }
                Navigator.pop(
                    context); // Close the drawer after language change
              },
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'ar',
                  child: Text('العربية'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
