import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/home/home_screen_controller.dart';
import 'package:untitled/screens/home/widgets/jokes_card_widget.dart';
import 'package:untitled/screens/utils/string_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenController c = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants().jokes),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: c.jokesList.length,
          itemBuilder: (BuildContext context, int index) {
            return JokeCardWidget(
              message: c.jokesList[index].joke,
            );
          },
        ),
      ),
    );
  }
}
