import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shein_app/shein_app/data/data_source/catogries_data_source.dart';
import 'package:shein_app/shein_app/data/data_source/product_data.dart';
import 'package:shein_app/shein_app/data/models/catogry_model.dart';
import 'package:shein_app/shein_app/data/models/product_model.dart';
import 'package:sizer/sizer.dart';

class CateogriesController extends GetxController {
  /////////variables/////
  TabController? tabController;
  var selected = 0.obs;
  List<CateogryItem> cateogry = [];
  List<CateogryItem> subCateogry = [];
  List<ProductItem> productItem = [];
  List<Tab> tabs = [];
  static const pageSize = 30;

  final PagingController<int, ProductItem> pagingController =
      PagingController(firstPageKey: 1);

  //to select cateogry from list
  getSelected(x) {
    selected.value = x;
    update();
  }

  ///////////////////Get All Cateogries
  Future getCateogries() async {
    try {
      var res = await CateogryData().getCateogryProduct();
      var cat = res["data"] as List;
      print(res);
      if (res["status"] == 200) {
        cateogry = cat.map((e) => CateogryItem.fromMap(e)).toList();
        for (int i = 0; i < cateogry.length; i++) {
          tabs.add(Tab(
            child: Text(
              cateogry[i].name,
              style: TextStyle(fontSize: 10.sp, color: Colors.black),
            ),
          ));
        }

        print("cateogryyyyy");
        // print(productCateogry.length);
        update();
      } else {
        print("no correct");
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  Future getCatogryById(id) async {
    try {
      var res = await CateogryData().getSubCateogry(id);
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        subCateogry = pro.map((e) => CateogryItem.fromMap(e)).toList();

        print("sub-sucess");

        update();
      } else {
        update();
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  Future<void> getProductsByCateogrries(page) async {
    try {
      var res = await ProductData().getCateogryProduct(page);
      var pro = res["data"] as List;
      if (res["status"] == 200) {
        productItem = pro.map((e) => ProductItem.fromMap(e)).toList();
        final isLastPage = productItem.length < 10;
        if (isLastPage) {
          print("isLoading");
          pagingController.appendLastPage(productItem);
          update();
        } else {
          print("isNoLoading");
          final nextPageKey = page + 1;
          pagingController.appendPage(productItem, nextPageKey);
          update();
        }
      }
    } catch (e) {
      print("something error ${e.toString()}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCateogries();
    getCatogryById(1);
    pagingController.addPageRequestListener((pageKey) {
      // print("key is $pageKey");
      //_fetchPage(pageKey);
      getProductsByCateogrries(pageKey);
      // pageKey + 1;
    });
    //tabController = TabController(length: 8, vsync: this);
  }
}
