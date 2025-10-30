import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/state/app_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppSettingsState>();
    final isDark = app.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Settings',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface))),
      body: ListView(children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          secondary: const Icon(Icons.dark_mode_outlined),
          value: isDark,
          onChanged: (v) => app.toggleDarkMode(v),
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('About'),
          subtitle:
              const Text('Bridal Jewelry Catalogue — curated inspirations.'),
        ),
        ListTile(
          leading: const Icon(Icons.open_in_new),
          title: const Text('Rate us on Play Store'),
          subtitle: const Text(
              'https://play.google.com/store/apps/details?id=glimmer.bridal'),
          onTap: () async {
            const url =
                'https://play.google.com/store/apps/details?id=glimmer.bridal';
            await Clipboard.setData(const ClipboardData(text: url));
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link copied to clipboard')));
            }
          },
        ),
      ]),
    );
  }
}
