import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/state/gallery_state.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/widgets/image_grid_tile.dart';
import 'package:glimmer/pages/image_viewer_page.dart';
import 'package:glimmer/theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Favorites',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: cs.onSurface))),
      body: SafeArea(
        child: Consumer<GalleryState>(builder: (context, gallery, _) {
          final items = gallery.favorites;
          if (items.isEmpty) return const _EmptyState();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                final item = items[index];
                final fav = gallery.isFavorite(item.id);
                return ImageGridTile(
                  item: item,
                  isFavorite: fav,
                  onToggleFavorite: () => gallery.toggleFavorite(item.id),
                  onTap: () => _openViewer(context, items, index),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  void _openViewer(BuildContext context, List<JewelryItem> items, int index) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, anim, __) =>
                ImageViewerPage(items: items, initialIndex: index),
            transitionsBuilder: (context, anim, sec, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 250)));
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(AppTokens.r24)),
            child: Icon(Icons.favorite_border, color: cs.primary, size: 56),
          ),
          const SizedBox(height: 16),
          Text('No favorites yet',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: cs.onSurface)),
          const SizedBox(height: 8),
          Text('Tap the heart on any design to save it here.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: cs.onSurface.withValues(alpha: 0.8))),
        ]),
      ),
    );
  }
}
