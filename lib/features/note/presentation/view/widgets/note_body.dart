import 'package:firebase_learn/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilies/app_colors.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          HeightSpacing(height: 20),
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.edit_note_outlined,color: AppColors.primaryColor,),
                    trailing: const Icon(Icons.delete,color: AppColors.red,),
                    title: const Text("Notes"),
                    subtitle: Text("dfsdfbskjdfkjsdkBKjdfklhkhfhglkfhglkflglkdzflhglkfglkfkhjkgshdkhkhzkjxfhghdfhghdfh"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
