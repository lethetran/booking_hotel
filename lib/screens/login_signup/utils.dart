import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source); 
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected!');
}

class ImageUtils {
  static Future<Uint8List> loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/selected_image.png';
    final imageFile = File(imagePath);

    if (await imageFile.exists()) {
      return await imageFile.readAsBytes();
    }

    throw Exception('Image file does not exist');
  }
}