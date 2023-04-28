import 'package:demo_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

import '../utils/utils.dart';

class HomeProvider extends ChangeNotifier {
  //Profanity filter instance
  final filter = ProfanityFilter();
  final textController = TextEditingController();
  final imgUrlController = TextEditingController();
  bool loadingUsingUrl = false;

  //check if text contains bad words
  bool checkProfanityText(String text) => filter.hasProfanity(text);

  //clear text controller values
  void clearControllerValue() {
    imgUrlController.clear();
    textController.clear();
    notifyListeners();
  }

  void update() => notifyListeners();

  //call api to check whether image contains nudity or not
  Future<void> checkImageNudity(BuildContext context) async {
    FocusManager.instance.primaryFocus!.unfocus();
    loadingUsingUrl = true;
    notifyListeners();
    final uri = Uri.tryParse(imgUrlController.text);

    //check for url validation
    if (uri != null && !uri.hasAbsolutePath) {
      Utils.showSnackBar(context, 'Please enter valid url');
      loadingUsingUrl = false;
      notifyListeners();
      return;
    }

    //api calling
    ApiService.instance
        .checkNudity(context, imgUrlController.text)
        .then((result) {
      if (result != null) {
        if (result.unsafe) {
          Utils.showSnackBar(context, 'Image contains nudity');
        } else {
          Utils.showSnackBar(context, 'Image safe to use');
        }
      }
      loadingUsingUrl = false;
      notifyListeners();
    });
  }
}
