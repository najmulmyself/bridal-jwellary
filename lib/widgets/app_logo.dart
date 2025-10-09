import 'package:flutter/material.dart';
import 'package:glimmer/theme.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showTitle;
  const AppLogo({super.key, this.size = 72, this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color.withValues(alpha: 0.08), shape: BoxShape.circle),
        child: Icon(Icons.workspace_premium, color: color, size: size * 0.56),
      ),
      if (showTitle) SizedBox(height: AppTokens.s16),
      if (showTitle)
        Text('Bridal Jewelry Ideas', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface))
    ]);
  }
}
