import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String categoryName;
  final String? id;
  final DateTime? createdAt;

  CategoryModel({required this.categoryName, this.id, this.createdAt});

  factory CategoryModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    final rawCreatedAt = json['createdAt'];
    DateTime? parsedCreatedAt;

    if (rawCreatedAt is Timestamp) {
      parsedCreatedAt = rawCreatedAt.toDate();
    } else if (rawCreatedAt is String) {
      try {
        parsedCreatedAt = DateTime.parse(rawCreatedAt);
      } catch (e) {
        parsedCreatedAt = null;
      }
    } else {
      parsedCreatedAt = null;
    }

    return CategoryModel(
      id: doc.id,
      categoryName: json["categoryName"] ?? '',
      createdAt: parsedCreatedAt, // هنا القيمة DateTime مش Timestam
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryName": categoryName,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
