import 'package:get/get.dart';

class CustomDropDownController extends GetxController {
  var selectedFavorite = Rxn<String>();

  void toggleFavorite(String item) {
    if (selectedFavorite.value == item) {
      selectedFavorite.value = null; // Disable if already selected
    } else {
      selectedFavorite.value = item; // Enable new favorite
    }
  }

  // Check if an item is the favorite
  bool isFavorite(String item) => selectedFavorite.value == item;
}
