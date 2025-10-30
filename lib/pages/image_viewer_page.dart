import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/state/gallery_state.dart';
import 'package:glimmer/widgets/interstitial_ad_placeholder.dart';

class ImageViewerPage extends StatefulWidget {
  final List<JewelryItem> items;
  final int initialIndex;
  const ImageViewerPage(
      {super.key, required this.items, required this.initialIndex});

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  late final PageController _controller;
  int _current = 0;
  bool _showAd = false;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _controller = PageController(initialPage: _current);
  }

  void _onPageChanged(int index) {
    setState(() => _current = index);
    final showAd = context.read<GalleryState>().registerSwipeAndShouldShowAd();
    if (showAd && mounted) setState(() => _showAd = true);
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    final cs = Theme.of(context).colorScheme;
    final gallery = context.watch<GalleryState>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: _onPageChanged,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isFav = gallery.isFavorite(item.id);
              return Stack(children: [
                Center(
                  child: Hero(
                    tag: item.id,
                    child: InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 4,
                      child: Image.network(item.imageUrl,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator())),
                    ),
                  ),
                ),
                // Top controls
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Row(children: [
                    _TopIconButton(
                        icon: Icons.close,
                        onPressed: () => Navigator.pop(context)),
                    const Spacer(),
                    _TopIconButton(
                        icon: isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.white,
                        onPressed: () => gallery.toggleFavorite(item.id)),
                    const SizedBox(width: 8),
                    _TopIconButton(
                        icon: Icons.share_outlined,
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: item.imageUrl));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Image link copied')));
                          }
                        }),
                  ]),
                ),
                // Bottom arrows
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _NavPill(
                          icon: Icons.chevron_left,
                          enabled: _current > 0,
                          onTap: () => _controller.previousPage(
                              duration: const Duration(milliseconds: 260),
                              curve: Curves.easeOut),
                        ),
                        _NavPill(
                          icon: Icons.chevron_right,
                          enabled: _current < items.length - 1,
                          onTap: () => _controller.nextPage(
                              duration: const Duration(milliseconds: 260),
                              curve: Curves.easeOut),
                        ),
                      ]),
                ),
              ]);
            },
          ),
          if (_showAd)
            InterstitialAdPlaceholder(
              onClose: () => setState(() => _showAd = false),
            ),
        ]),
      ),
    );
  }
}

class _TopIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;
  const _TopIconButton(
      {required this.icon, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(999)),
        child: Icon(icon, color: color ?? Colors.white),
      ),
    );
  }
}

class _NavPill extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;
  const _NavPill(
      {required this.icon, required this.onTap, required this.enabled});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white.withValues(alpha: 0.4))),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
