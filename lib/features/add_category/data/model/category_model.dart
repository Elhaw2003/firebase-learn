import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CategoryModel {
  final String categoryName;
  final String? categoryId;
  final DateTime? createdAt;
  final String? userId;
  CategoryModel({required this.categoryName, this.categoryId,this.userId, this.createdAt});

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
      categoryId: doc.id,
      userId: json["userId"],
      categoryName: json["categoryName"] ?? '',
      createdAt: parsedCreatedAt, // هنا القيمة DateTime مش Timestam
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryName": categoryName,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
      "userId": FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
