import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/note_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await ScreenUtil.ensureScreenSize();
  bool isFirstRun = await check();
  runApp(NoteApp(
    isFirstRun: isFirstRun,
  ));
}

Future<bool> check() async {
  var box = await Hive.openBox('UserData');
  bool isFirstRun = box.get('isFirstRun', defaultValue: true);
  if (isFirstRun) {
    await box.put('isFirstRun', false);
  }
  return isFirstRun;
}
