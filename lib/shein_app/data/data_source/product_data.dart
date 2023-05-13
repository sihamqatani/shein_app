import 'package:shein_app/shein_app/core/utils/helpers/dio_helper/dio_helper.dart';
import 'package:shein_app/shein_app/core/utils/routes/api_routes.dart';

class ProductData {
  Future getCateogryProduct(page) async {
    try {
      var response = await DioHelper.getData(
          url: "${ApiRoutes.productByCateogry}", query: {"page": page});
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
}
