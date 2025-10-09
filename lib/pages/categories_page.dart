import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/state/gallery_state.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/widgets/banner_ad_placeholder.dart';
import 'package:glimmer/widgets/image_grid_tile.dart';
import 'package:glimmer/pages/image_viewer_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Categories',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: cs.onSurface))),
      bottomNavigationBar:
          const BannerAdPlaceholder(margin: EdgeInsets.fromLTRB(16, 0, 16, 16)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: GalleryState.categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final cat = GalleryState.categories[index];
          final icon = _iconForCategory(cat);
          return ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withValues(alpha: 0.4),
            leading: Icon(icon, color: cs.primary),
            title: Text(cat,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: cs.onSurface)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CategoryGridPage(category: cat))),
          );
        },
      ),
    );
  }

  IconData _iconForCategory(String cat) {
    switch (cat) {
      case 'Necklaces':
        return Icons.workspace_premium_outlined;
      case 'Earrings':
        return Icons.earbuds_outlined;
      case 'Bangles':
        return Icons.circle_outlined;
      case 'Bridal Sets':
        return Icons.style_outlined;
      default:
        return Icons.category_outlined;
    }
  }
}

class CategoryGridPage extends StatelessWidget {
  final String category;
  const CategoryGridPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(category,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: cs.onSurface))),
      bottomNavigationBar:
          const BannerAdPlaceholder(margin: EdgeInsets.fromLTRB(16, 0, 16, 16)),
      body: SafeArea(
        child: Consumer<GalleryState>(builder: (context, gallery, _) {
          final items = gallery.itemsForCategory(category);
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
