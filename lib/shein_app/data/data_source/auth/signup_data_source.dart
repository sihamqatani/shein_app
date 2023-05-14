import 'package:shein_app/shein_app/core/utils/routes/api_routes.dart';

import '../../../core/utils/helpers/dio_helper/dio_helper.dart';

class SignupData {
  SignupData();

  Future postSignUpData(
      {required name,
      required email,
      required pasword,
      required confirmPassword,
      registerby}) async {
    Map<String, dynamic> data = {
      "name": name,
      "email_or_phone": email,
      "password": pasword,
      "passowrd_confirmation": confirmPassword,
      "register_by": ""
    };

    var response = await DioHelper.postData(url: ApiRoutes.signUp, data: data);
    if (response.statusCode == 201) {
      print("our response${response.data}");
      return response;
    } else {
      response;
      print(response.data);
    }
  }
}
