import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_api/models/model.dart';
import 'package:getx_api/services/services.dart';

class AppController extends GetxController {
  List<Product> getposts = List<Product>().obs;
  var services = Services();
  var isLoading = true.obs;
  Timer timer;
  final length = 1.obs;
  @override
  void onInit() {
    fetchItems();
    // timer = Timer.periodic(Duration(seconds: 3), (timer) => fetchItems());
    super.onInit();
  }

  Future fetchItems() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      isLoading(true);

      getposts = await services.getalldata();
    } finally {
      isLoading(false);
    }
  }
}
