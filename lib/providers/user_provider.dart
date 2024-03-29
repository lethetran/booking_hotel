import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _userImage = 'assets/images/photo.png';

  String get userImage => _userImage;

  void updateUserImage(String newImage) {
    _userImage = newImage;
    notifyListeners();
  }
}