import 'package:flutter/material.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatefulWidget {
  const ProfileCardApp({super.key});

  @override
  State<ProfileCardApp> createState() => _ProfileCardAppState();
}

class _ProfileCardAppState extends State<ProfileCardApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // 🔄 Ganti tema secara bergantian (Light → Dark → System)
  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.system;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  // 🔤 Teks indikator tema aktif
  String get themeText {
    switch (_themeMode) {
      case ThemeMode.light:
        return '☀️ Light';
      case ThemeMode.dark:
        return '🌙 Dark';
      default:
        return '⚙️ System';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);

          return Scaffold(
            backgroundColor: theme.colorScheme.background,
            appBar: AppBar(
              title: const Text('Profile Card App'),
              centerTitle: true,
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              actions: [
                TextButton(
                  onPressed: toggleTheme,
                  child: Text(
                    themeText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            body: const ProfilePage(),
          );
        },
      ),
    );
  }
}
