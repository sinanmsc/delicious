import 'package:delicious/core/local_db/objectbox.dart';
import 'package:delicious/core/router/router_path.dart';
import 'package:delicious/core/theme/dark_theme.dart';
import 'package:delicious/core/theme/theme.dart';
import 'package:delicious/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.create();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterGo.router,
      theme: ref.watch(settingsProvider).theme == 0
          ? ref.watch(appThemeProvider)
          : ref.watch(appDarkThemeProvider),
    );
  }
}
