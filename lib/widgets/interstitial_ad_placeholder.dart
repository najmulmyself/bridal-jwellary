import 'package:flutter/material.dart';
import 'package:glimmer/theme.dart';

class InterstitialAdPlaceholder extends StatelessWidget {
  final VoidCallback onClose;
  const InterstitialAdPlaceholder({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: Colors.green.withValues(alpha: 0.5),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: cs.surface,
              borderRadius: BorderRadius.circular(AppTokens.r16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 12))
              ]),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.auto_awesome, size: 48, color: cs.primary),
            const SizedBox(height: 12),
            Text('Sponsored Inspiration',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: cs.onSurface)),
            const SizedBox(height: 8),
            Text('Discover exclusive bridal offers curated just for you.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: cs.onSurface.withValues(alpha: 0.8))),
            const SizedBox(height: 16),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onClose, child: const Text('Continue'))),
          ]),
        ),
      ),
    );
  }
}
