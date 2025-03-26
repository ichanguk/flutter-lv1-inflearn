import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'asset/config/.env');

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [StatModelSchema],
    directory: dir.path,
  );

  GetIt.I.registerSingleton<Isar>(isar);

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower'
      ),
      home: HomeScreen(),
    )
  );
}
