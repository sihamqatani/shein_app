import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "name is not valid".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email is not valid".tr;
    }
  }
  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "number is not valid";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phone no.  is not valid".tr;
    }
  }

  if (val.isEmpty) {
    return "must be not empty".tr;
  }

  if (val.length < min) {
    return "${"must be less than"}$min";
  }

  if (val.length > max) {
    return "${"must be large than"} $max";
  }
}
