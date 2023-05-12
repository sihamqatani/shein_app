import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/data/data_source/catogries_data_source.dart';
import 'package:shein_app/shein_app/data/models/catogry_model.dart';
import 'package:sizer/sizer.dart';

class CateogriesController extends GetxController {
  /////////variables/////
  TabController? tabController;
  var selected = 0.obs;
  List<CateogryItem> cateogry = [];
  List<CateogryItem> subCateogry = [];
  List<Tab> tabs = [];
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

  @override
  void onInit() {
    getCateogries();
    //tabController = TabController(length: 8, vsync: this);
    super.onInit();
  }
}
