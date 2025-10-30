import 'package:flutter/material.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/theme.dart';

class ImageGridTile extends StatelessWidget {
  final JewelryItem item;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;
  final bool isFavorite;
  const ImageGridTile(
      {super.key,
      required this.item,
      required this.onTap,
      required this.onToggleFavorite,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppTokens.r16);
    return Semantics(
      label: item.title,
      button: true,
      child: Stack(children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: radius,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 8)),
                ],
              ),
              child: ClipRRect(
                borderRadius: radius,
                child: Hero(
                  tag: item.id,
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: Colors.black.withValues(alpha: 0.04),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primary)),
                      );
                    },
                    errorBuilder: (context, error, stack) => Container(
                      color: Colors.black.withValues(alpha: 0.04),
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image,
                          color: Colors.redAccent),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onToggleFavorite,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(999)),
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black),
            ),
          ),
        )
      ]),
    );
  }
}
