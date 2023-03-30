import 'package:fluttertoast/fluttertoast.dart';
import 'package:geo_app/variants/variants.dart';

class ToastUtils {
  static showError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.err,
        textColor: AppColors.white,
        fontSize: 16.0);
  }

  static showSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.success,
        textColor: AppColors.white,
        fontSize: 16.0);
  }

  static showInfo(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        fontSize: 16.0);
  }
}
