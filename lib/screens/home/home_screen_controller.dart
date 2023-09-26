import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/screens/home/home_screen_model.dart';

class HomeScreenController extends GetxController {
  final dio = Dio();
  final box = GetStorage();
  List jokesList = <HomeScreenModel>[].obs;
  Timer? timer;


  @override
  void onInit() {
    final savedItems = box.read<List<dynamic>>('items') ?? [];
    for (var element in savedItems) {
     jokesList.add(HomeScreenModel.fromJson(element)) ;
    }
    fetchJokes();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) => fetchJokes());

    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void fetchJokes() async {
    try {
      const String apiUrl =
          'https://geek-jokes.sameerkumar.website/api?format=json';
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final data = HomeScreenModel.fromJson(response.data);
        if(jokesList.length>=10){
          jokesList.removeAt(9);
        }
        jokesList.insert(0, data);
        final itemMapList = jokesList.map((item) => item.toJson()).toList();
        box.write('items', itemMapList);

      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
