import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<File> selectImage()async {
  final XFile image = await _picker.pickImage(source: ImageSource.gallery);
  return File(image.path);
}

Future<File> takeImage()async {
  final XFile image = await _picker.pickImage(source: ImageSource.camera);
  return File(image.path);
}