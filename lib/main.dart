import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'src/core/gen/l10n/app_localizations.dart';
import 'src/core/logger/riverpod_log.dart';
import 'src/presentation/core/application_state/localization_provider/localization_provider.dart';
import 'src/presentation/core/router/router.dart';
import 'src/presentation/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ProviderScope(observers: [RiverpodObserver()], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery.withClampedTextScaling(
          maxScaleFactor: 1.5,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Alive Live Streaming',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: ref.watch(localizationProvider),
            theme: context.lightTheme,
            darkTheme: context.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: ref.read(goRouterProvider),
          ),
        );
      },
    );
  }
}
