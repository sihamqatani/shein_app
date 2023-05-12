import 'package:shein_app/shein_app/core/utils/routes/api_routes.dart';

import '../../core/utils/helpers/dio_helper/dio_helper.dart';

class CateogryData {
  Future getCateogryProduct() async {
    try {
      var response = await DioHelper.getData(
        url: ApiRoutes.allCateogries,
      );
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print("error pro here....${e.toString()}");
    }
  }

  Future getSubCateogry(id) async {
    try {
      var response = await DioHelper.getData(
        url: "${ApiRoutes.subCateogries}$id",
      );
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
