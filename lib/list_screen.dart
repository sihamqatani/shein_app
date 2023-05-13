import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  final PagingController<int, String> pagingController =
      PagingController(firstPageKey: 0);
  final pageSize = 10;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchItems(pageKey);
    });
  }

  void fetchItems(int pageKey) async {
    try {
      final newItems = await _fetchItemsFromApi(pageKey);
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<List<String>> _fetchItemsFromApi(int pageKey) async {
    // Replace this with your own API call to fetch the next page of items
    // await Future.delayed(Duration(seconds: 2));
    return List.generate(
        pageSize, (index) => 'Item ${(pageKey * pageSize) + index}');
  }
}

class ListScreen extends StatelessWidget {
  final controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: PagedListView<int, String>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<String>(
          itemBuilder: (context, item, index) {
            return ListTile(
              title: Text(item),
            );
          },
          firstPageProgressIndicatorBuilder: (_) =>
              Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder: (_) =>
              Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
