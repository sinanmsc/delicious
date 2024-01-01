import 'package:delicious/core/router/router_path.dart';
import 'package:delicious/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: RouterGo.router,
      theme: ref.watch(appThemeProvider),
    );
  }
}
