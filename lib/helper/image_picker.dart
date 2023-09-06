import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SaiImagePicker {
  SaiImagePicker() {}
  static Future<Map?> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print('object');
      return {
        'base64': base64Encode(File(pickedImage.path).readAsBytesSync()),
        'file': File(pickedImage.path)
      };
    }
  }
}
