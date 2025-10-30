import 'package:firebase_storage/firebase_storage.dart';
import 'package:glimmer/models/jewelry_item.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<JewelryItem>> getJewelryItems() async {
    try {
      final List<JewelryItem> items = [];
      final ListResult result = await _storage.ref('jewelry').listAll();

      for (final prefix in result.prefixes) {
        final category = prefix.name;
        final ListResult categoryResult = await prefix.listAll();
        for (final item in categoryResult.items) {
          final imageUrl = await item.getDownloadURL();
          final id = item.name.split('.').first;
          items.add(JewelryItem(
            id: id,
            imageUrl: imageUrl,
            category: category,
            title: id.replaceAll('_', ' '),
          ));
        }
      }
      return items;
    } catch (e) {
      print('Error getting jewelry images: $e');
      return [];
    }
  }
}
