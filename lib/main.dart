import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/screens/myapp.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}


