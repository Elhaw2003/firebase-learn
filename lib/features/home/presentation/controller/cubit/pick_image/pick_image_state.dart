part of 'pick_image_cubit.dart';

@immutable
sealed class PickImageState {}

final class PickImageInitialState extends PickImageState {}
final class PickImagePickImageSuccessState extends PickImageState {}
