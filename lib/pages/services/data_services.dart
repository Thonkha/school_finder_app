import 'dart:convert';

import 'package:school_finder_app/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseURL = "https://us-east-1.aws.data.mongodb-api.com/app/schools-bkgfj/endpoint/getSchools";

  Future<List<DataModel>> getInfo() async {
    //var apiURL = '/getSchools';
    http.Response res = await http.get(Uri.parse(baseURL));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
