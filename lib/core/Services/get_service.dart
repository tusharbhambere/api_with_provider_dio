import 'package:bgmi_tip_tricks/core/Model/photo_model.dart';
import 'package:bgmi_tip_tricks/core/constant/url.dart';
import 'package:dio/dio.dart';

class GetServices {
  var dio = new Dio();

  Future<List<PhotoModel>?> getservices() async {
    var responce = await dio.get(AllUrl().apiUrl);
    if (responce.statusCode == 200) {
      try {
        List<PhotoModel> services = PhotoModel.fromJsonList(responce.data);
        return services;
      } catch (e) {}
    } else {
      return null;
    }
  }
}
