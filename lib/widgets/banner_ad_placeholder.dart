import 'package:flutter/material.dart';
import 'package:glimmer/theme.dart';

class BannerAdPlaceholder extends StatelessWidget {
  final EdgeInsets margin;
  const BannerAdPlaceholder({super.key, this.margin = const EdgeInsets.all(12)});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: margin,
      decoration: BoxDecoration(color: cs.primaryContainer, borderRadius: BorderRadius.circular(AppTokens.r16), border: Border.all(color: cs.primary.withValues(alpha: 0.15))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        Icon(Icons.ad_units, color: cs.primary),
        const SizedBox(width: 12),
        Expanded(child: Text('Sponsored • Elegant wedding deals', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onPrimaryContainer), overflow: TextOverflow.ellipsis)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: cs.primary, borderRadius: BorderRadius.circular(999)),
          child: const Text('Ad', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        )
      ]),
    );
  }
}
