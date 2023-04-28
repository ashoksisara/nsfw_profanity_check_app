import 'package:flutter/material.dart';

import '../shared/constant/app_color.dart';
import 'reachability.dart';

class Utils {
  factory Utils() {
    return _singleton;
  }

  static final Utils _singleton = Utils._internal();

  Utils._internal();


  //common snackbar for app
  static void showSnackBar(BuildContext context, String message,
      {int duration = 2, SnackBarAction? action}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColor.appWhite,
        ),
      ),
      backgroundColor: AppColor.appBlack,
      duration: Duration(seconds: duration),
      action: action,
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //check for internet
  static bool isInternetAvailable(BuildContext context,
      {bool isInternetMessageRequire = true}) {
    bool isInternet = Reachability.instance.isInterNetAvailable();
    if (!isInternet && isInternetMessageRequire) {
      Utils.showSnackBar(context, "Please check your internet connection");
    }
    return isInternet;
  }
}
