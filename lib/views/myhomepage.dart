import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/appcontroller.dart';

class MyHomePage extends StatelessWidget {
  final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GEtX -Api'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Obx(() {
              if (controller.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return ListView.builder(
                    itemCount: controller.getposts.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(controller.getposts[index].id),
                        subtitle: Text(controller.getposts[index].name),
                      ));
                    });
            }))
          ],
        ),
      ),
    );
  }
}
