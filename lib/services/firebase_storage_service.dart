import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glimmer/models/jewelry_item.dart';

class FirebaseStorageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<JewelryItem>> getJewelryItems() async {
    try {
      final querySnapshot = await _firestore.collection('jewelry_items').get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return JewelryItem(
          id: doc.id,
          imageUrl: data['imageUrl'] ?? '',
          category: data['category'] ?? 'Uncategorized',
          title: data['title'] ?? '',
        );
      }).toList();
    } catch (e) {
      print('Error getting jewelry items from Firestore: $e');
      return [];
    }
  }

  // Method to add sample data (for testing)
  Future<void> addSampleItems() async {
    try {
      final batch = _firestore.batch();

      final sampleItems = [
        {
          'imageUrl':
              'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800',
          'category': 'Necklaces',
          'title': 'Golden Bridal Necklace'
        },
        {
          'imageUrl':
              'https://images.unsplash.com/photo-1601121141461-9d6647bca1ed?w=800',
          'category': 'Earrings',
          'title': 'Pearl Drop Earrings'
        },
        {
          'imageUrl':
              'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=800',
          'category': 'Bangles',
          'title': 'Traditional Gold Bangles'
        },
        {
          'imageUrl':
              'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800',
          'category': 'Bridal Sets',
          'title': 'Complete Bridal Set'
        },
      ];

      for (var item in sampleItems) {
        final docRef = _firestore.collection('jewelry_items').doc();
        batch.set(docRef, item);
      }

      await batch.commit();
      print('Sample items added successfully!');
    } catch (e) {
      print('Error adding sample items: $e');
    }
  }
}
