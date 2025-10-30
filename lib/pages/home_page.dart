import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/state/gallery_state.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/widgets/image_grid_tile.dart';
import 'package:glimmer/widgets/banner_ad_placeholder.dart';
import 'package:glimmer/pages/image_viewer_page.dart';
import 'package:glimmer/pages/categories_page.dart';
import 'package:glimmer/pages/favorites_page.dart';
import 'package:glimmer/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bridal Jewelry',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: cs.onSurface)),
        actions: [
          IconButton(
            tooltip: 'Categories',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CategoriesPage())),
            icon: const Icon(Icons.category_outlined),
          ),
          IconButton(
            tooltip: 'Settings',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SettingsPage())),
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FavoritesPage())),
        backgroundColor: cs.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.favorite),
      ),
      bottomNavigationBar:
          const BannerAdPlaceholder(margin: EdgeInsets.fromLTRB(16, 0, 16, 16)),
      body: SafeArea(
        child: Consumer<GalleryState>(
          builder: (context, gallery, _) {
            // Loading state
            if (gallery.isLoading) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: cs.primary),
                    const SizedBox(height: 16),
                    Text('Loading jewelry...',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              );
            }

            // Error state
            if (gallery.errorMessage != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: cs.error),
                      const SizedBox(height: 16),
                      Text('Oops! Something went wrong',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(gallery.errorMessage!,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => gallery.retry(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            final items = gallery.filteredItems;

            // Empty state
            if (items.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.image_not_supported_outlined,
                          size: 64, color: cs.primary.withValues(alpha: 0.5)),
                      const SizedBox(height: 16),
                      Text('No jewelry found',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(
                          'Please check your Firebase Storage.\nImages should be in: jewelry/<category>/',
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            }

            // Grid view
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
          },
        ),
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
