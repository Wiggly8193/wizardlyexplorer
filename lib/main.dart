import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/screens/splash.dart';
import 'package:wizardly_explorer/theme/theme_data.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: true, // Set to false for production builds
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp(
          useInheritedMediaQuery:
              true, // To respect the simulated device properties
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const Splash(),
        );
      },
    );
  }
}
