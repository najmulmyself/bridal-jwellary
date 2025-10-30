import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glimmer/models/jewelry_item.dart';
import 'package:glimmer/services/firebase_storage_service.dart';

class GalleryState extends ChangeNotifier {
  static const _kFavKey = 'favorite_item_ids';
  static const categories = <String>['Necklaces', 'Earrings', 'Bangles', 'Bridal Sets'];

  final FirebaseStorageService _storageService = FirebaseStorageService();
  List<JewelryItem> _items = [];
  final Set<String> _favoriteIds = <String>{};
  String? _currentCategory; // null means all
  int _swipeCount = 0;

  GalleryState() {
    _loadFavorites();
    _fetchJewelryItems();
  }

  Future<void> _fetchJewelryItems() async {
    _items = await _storageService.getJewelryItems();
    notifyListeners();
  }

  List<JewelryItem> get items => List.unmodifiable(_items);
  List<JewelryItem> get favorites => _items.where((e) => _favoriteIds.contains(e.id)).toList(growable: false);
  Set<String> get favoriteIds => _favoriteIds;
  String? get currentCategory => _currentCategory;

  List<JewelryItem> itemsForCategory(String? category) {
    if (category == null) return items;
    return _items.where((e) => e.category == category).toList(growable: false);
  }

  List<JewelryItem> get filteredItems => itemsForCategory(_currentCategory);

  bool isFavorite(String id) => _favoriteIds.contains(id);

  Future<void> toggleFavorite(String id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kFavKey, _favoriteIds.toList(growable: false));
  }

  void setCategory(String? category) {
    _currentCategory = category;
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_kFavKey) ?? <String>[];
    _favoriteIds
      ..clear()
      ..addAll(list);
    notifyListeners();
  }

  // Returns true when an interstitial should be shown (every 5 swipes)
  bool registerSwipeAndShouldShowAd() {
    _swipeCount += 1;
    if (_swipeCount % 5 == 0) {
      return true;
    }
    return false;
  }
}
