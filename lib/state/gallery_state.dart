import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glimmer/models/jewelry_item.dart';

class GalleryState extends ChangeNotifier {
  static const _kFavKey = 'favorite_item_ids';
  static const categories = <String>['Necklaces', 'Earrings', 'Bangles', 'Bridal Sets'];

  final List<JewelryItem> _items = _buildSampleItems();
  final Set<String> _favoriteIds = <String>{};
  String? _currentCategory; // null means all
  int _swipeCount = 0;

  GalleryState() {
    _loadFavorites();
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

List<JewelryItem> _buildSampleItems() {
  const urls = <String>[
    'https://pixabay.com/get/gfbef2c2db820f8c07906f2a4fadc77ec6c921f238c0ee5c6e3c6211e07979336eb0db204394d076d76f23fd4a132d72c7983d0ffee4b97467d9202e618f45bf4_1280.jpg',
    'https://pixabay.com/get/ge25fab032071e58ca07b4e24b4d375d820decfe9e415f0aa6a6f961a1bce9c56a64f85e80876f928a246603f13b6d6cd9afb74953bd401c698b73e5472b248a4_1280.jpg',
    'https://pixabay.com/get/gd7bdff060e4240f4e40d74391e1ac062cd87f53789fb1eb69c3bed25305620077e0c3d5b9479112c592aaddca3815998bf5deff8a7c1bc024b66fc7a4f220255_1280.jpg',
    'https://pixabay.com/get/g9d9c73ac292fedf2affb14b7871d3e63ea9a57e838aa7dfb857930db772ba630d08931cbbd912200e79aa0b5f523202c47eb0e900b98e58f8223b969395e404c_1280.jpg',
    'https://pixabay.com/get/g677d3e70305e113179a33bb9c8d2cdc627dd29f876890dcf67a34ef2f863f11f5095bc4864c3bd948e9c9794ddf8d2ae22fdf2632002a5ccb349330e7cc94b26_1280.jpg',
    'https://pixabay.com/get/g9a5a5ddd600c379921616e0dd1f5be2e1d264a7451522eabec2ddf770581669189eca2c6a85ce362cff4ad9ca7099753316f00f748d959be9331412d5dcdafcf_1280.jpg',
    'https://pixabay.com/get/gb95dfbd6602fd703b09fcc10b5b2c1d4c14c9cf73dba0761d85fa08bf4da8bd0b04a692a483876ec973d3261ef96869a5ee2e8880c8b2ff57d4b0e80cc89cff6_1280.jpg',
    'https://pixabay.com/get/g7de843efe29240007b7429f89310d98d01ad926a401269ca4278f139b0851248e84b0f954108bf5c768c4095f53bab21d37b44e9c06628409304b02f9d5030ec_1280.jpg',
    'https://pixabay.com/get/g2d27f6e7484b8239080338f7be3f1c3586cc408d1aaf553659d136044181d62757dcf1e3406afc2341e891a2b5057644d05a924297fdd6081b26567bdc288c39_1280.jpg',
    'https://pixabay.com/get/g3563939fe2ba7b754d73fd8523206aefb6db78282046c8a6a4a3416d6a59a0820583ee0d25c047b8ae6c0c3ac766f8d5c9318ae3a5eec558ee01a0788e5d0b9e_1280.jpg',
    'https://pixabay.com/get/g7b873712e21f2a9812df42d5190cbf28ac68f33aaf9f1674e83f9bf4e408449aca472632569e6d20d46250b877c3af3738b7b67e165eb4b304411b4697e62d9c_1280.jpg',
    'https://pixabay.com/get/g8ca56937b4ff2331a8f92a597cf2e78b1b9fa504d935134e7e00e4caf50e0724567f8c694ad976bb0038ed93812a3c4b121caefb639e886f2c41249077200cce_1280.jpg',
    'https://pixabay.com/get/g4aa6a8ecdfa1dbabb3dfb750c10caade980627821680f212908b026749f140b56c5630fb74a188c1f52df495a348d1cda2b8c61bac65888082059438343e9158_1280.jpg',
    'https://pixabay.com/get/g58aa8e1d02d70811c064822ee95ad1f086449d4dfee8bbb88f0554fce057cebea59adecba32b15d242895c4f440d674df151f95b4b9cfd83b09a642f7f77f66e_1280.jpg',
    'https://pixabay.com/get/geb03548bba95ecaef1415bb0c2950e9e531729630901a1fd1de10b8e11708f6bf62c3991ada09d392a8f3fe4385eb3e6fad21de3c4b2f32af5af30f29efe3086_1280.jpg',
    'https://pixabay.com/get/g297390dad84c6cead2d0224c042eeea0afd667186d02de8f67d61bd53cc7352a1c2cdf8fb0b5d2b1b49a717439043e6946273f020257989646f860df9a726ba7_1280.jpg',
    'https://pixabay.com/get/gbec8b9ee2719974cbf0689225b7aa055d03605765528091bfc891698892db7523516282d343985682ab480c2eed94ac3c2fe7135e360d4bbc537f59873b3fac2_1280.jpg',
    'https://pixabay.com/get/g6ccbc57c9bee38426cfcb82e4a7aabe8f78e43af38928c4209d5db764741b2ba76944e53d38c82873732a9870613185c34f18ebedc3634acc38f1dc210344c1c_1280.jpg',
    'https://pixabay.com/get/ga8e1dd5e6e2fc59871689b1f4760f09487e1531a196b2812a7c35fdc5c33c8d6a88fc6172ff4dd6c8dfe02e1ab3a3f141eae7bacf10f1c9f0053555edd001e47_1280.jpg',
    'https://pixabay.com/get/gee66e76d74a286c964c9a8b140e73e610f4d18ee9e21730b8b9c5e7dbda397ea33ddd0580077b9f685cd734aaf9020a0e573c91e26af323d762413a7a83e985a_1280.jpg',
    'https://pixabay.com/get/g6b66ab2b6bac53e80725940d466adde3c52ff92137347b3f89ee73cf1fd05a92acf7da00f7ed83166e30ef6e02ad6a287ff1d09f26eabd1e18f15d70a956841e_1280.jpg',
    'https://pixabay.com/get/g2d6a065920ed8d62f843b05060751c887295d7ab899bfa0928c9cae150e9dbf20d918d775f822ef83bfdcf46fff5dd36e2894251c2c9d07bb3e2e2cb52259473_1280.jpg',
    'https://pixabay.com/get/g2c43c3463a70254250ce5277176613f08a446a881f2f1b934fddbe460ed2e180bc81f84d77df998758530bc408d376300de26637f04c7e71ae6c1de0f0efbbc1_1280.jpg',
    'https://pixabay.com/get/g5b3342af86843db8b0a6628f5ca6381a1df3d4a305498596f18020f9b3e6a81b0c8376213f17cbcd71f96e807892bae53e714a1a9ea8c77f4e7d1959668c6c7c_1280.jpg',
  ];

  final List<JewelryItem> items = [];
  // Assign 6 items to each of the 4 categories (24 total)
  const cats = ['Necklaces', 'Earrings', 'Bangles', 'Bridal Sets'];
  int i = 0;
  for (final url in urls) {
    final cat = cats[(i ~/ 6).clamp(0, 3)];
    items.add(JewelryItem(id: 'item_${i + 1}', imageUrl: url, category: cat, title: '$cat ${i % 6 + 1}'));
    i++;
  }
  return items;
}
