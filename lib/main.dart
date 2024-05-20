import 'package:flutter/material.dart';
import 'package:mafqud/core/app/my_app.dart';
import 'package:mafqud/core/function/check_state_changes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkStateChanges();
  runApp(const MyApp());
}
