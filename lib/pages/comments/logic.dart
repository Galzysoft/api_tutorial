import 'dart:convert';

import 'package:data_model/pages/comments/comments_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'state.dart';

class CommentsLogic extends GetxController {
  final CommentsState state = CommentsState();
  String baserver = "https://jsonplaceholder.typicode.com";
  Map<String, String> headers = {
    'content-type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': "Bearer dggdgdgfgf2f353gedhdhdxxgdgegegdxdheheheheh" ,
  };

  Future<List<CommentsModel>> getComments({required String id}) async {
    List<CommentsModel> listComents = [];
    Uri url = Uri.parse(baserver + "/posts/$id/comments");

    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> sampleList = jsonDecode(response.body);
      listComents = sampleList.map((e) => CommentsModel.fromJson(e)).toList();
      return listComents;
    }
else{ return listComents;}

  }
}
