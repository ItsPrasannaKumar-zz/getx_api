import 'package:getx_api/models/model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<Product>> getalldata() async {
    var response = await http
        .get("http://192.168.1.13/image_upload_php_mysql/viewAll.php");
    if (response.statusCode == 200) {
      var data = response.body;
      return productFromJson(data);
    } else {
      return null;
    }
  }
}
