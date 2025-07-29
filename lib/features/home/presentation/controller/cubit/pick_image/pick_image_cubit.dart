import 'dart:io';

import 'package:bloc/bloc.dart';
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
