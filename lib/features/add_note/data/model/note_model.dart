import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  // String? noteId;
  final DateTime? createdAt;
  final String title;
  final String description;
  NoteModel({
    required this.title,
    required this.description,
    this.createdAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {

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




    return NoteModel(
        title: json['title'],
        description: json['description'],
        createdAt: parsedCreatedAt
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}
