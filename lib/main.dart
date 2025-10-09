import 'package:flutter/material.dart';
import 'package:glimmer/theme.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/state/app_settings.dart';
import 'package:glimmer/state/gallery_state.dart';
import 'package:glimmer/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettingsState()),
        ChangeNotifierProvider(create: (_) => GalleryState()),
      ],
      child: Consumer<AppSettingsState>(
        builder: (context, app, _) => MaterialApp(
          title: 'Bridal Jewelry Ideas',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: app.themeMode,
          home: const SplashPage(),
        ),
      ),
    );
  }
}
