import 'dart:io';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitialState());


  XFile? image;



  pickImage(ImageSource imageSource)async {

    final ImagePicker imagePicker = ImagePicker();



    image = await imagePicker.pickImage(source: imageSource);

    if(image != null){



      emit(PickImagePickImageSuccessState());

    }


  }
}

///------------  firebase storage  ------------------
///
///
///
/// ---------- upload and get url image ---------------
// File? file;
//
// String? urlImage;
// file = File(image!.path);
// var imageName = basename(image!.path);

// var refStorage = FirebaseStorage.instance.ref("images").child(imageName);>>>>  if i want to create folder (images) and put image in folder

// await refStorage.putFile(file!);
//
// urlImage = await refStorage.getDownloadURL();

/// ----------- delete url image --------------
// FirebaseStorage.instance.refFromUrl(urlImage!).delete();