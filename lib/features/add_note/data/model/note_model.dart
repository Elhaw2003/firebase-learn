class NoteModel{
  // String? noteId;
  String title;
  String description;
  NoteModel({required this.title,required this.description,});

  factory NoteModel.fromJson(Map<String,dynamic> json){
    return NoteModel(title: json['title'], description: json['description']);
  }

  Map<String,dynamic> toJson() {
    return {

      "title" : title,
      "description" : description,
    };
  }

}