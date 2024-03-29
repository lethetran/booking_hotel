import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class ImageManager {
  static const String _imagePath = '/selected_image.png';

  Future<void> saveImage(Uint8List imageBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final imageFile = File('${directory.path}$_imagePath');
    await imageFile.writeAsBytes(imageBytes);
  }

  Future<Uint8List?> loadImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final imageFile = File('${directory.path}$_imagePath');

    if (await imageFile.exists()) {
      return await imageFile.readAsBytes();
    }
    return null;
  }
}