import 'package:cosnect/generated/l10n.dart';
import 'package:cosnect/src/provider/coser_provider.dart';
import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:cosnect/src/provider/shared_preference_provider.dart';
import 'package:cosnect/src/repository/memo_database.dart';
import 'package:cosnect/src/router/app_router.dart';
import 'package:cosnect/src/theme/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final Talker talker = TalkerFlutter.init();

late final ProviderContainer appContainer;
late AppDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://aihuvgrdccdldeuvodgl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFpaHV2Z3JkY2NkbGRldXZvZGdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA1MDg4NzgsImV4cCI6MjAzNjA4NDg3OH0.KOcW_igc1-jrINcT1FGHikCliJfx0nVX_RjKO1h4a_s',
  );

  // 앱 초기 작업 시작
  List<Override> overrideList = [
    sharedPreferencesProvider.overrideWithValue(
      SharedPreferencesUtility(await SharedPreferences.getInstance()),
    ),
  ];

  database = AppDatabase();
  appContainer = ProviderContainer(
    overrides: overrideList,
    observers: [
      TalkerRiverpodObserver(
        talker: talker,
      ),
    ],
  );

  // 메모장 리스트와 코스어 리스트를 앱이 켜져있는동안 계속해서 사용해야하기에 미리 리스트를 받아온다.
  await appContainer.read(coserProvider.notifier).fetchCoserList();
  await appContainer.read(notepadProvider.notifier).fetchNotepadList();

  // 앱 시작시 모든 권한의 허용여부를 체크해준다.
  // await appContainer.read(notificationPermissionProvider.notifier).checkPermission();
  // await appContainer.read(locationPermissionProvider.notifier).checkPermission();

  runApp(
    UncontrolledProviderScope(
      container: appContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    // final bool useDarkMode = ref.watch(appSettingProvider.select((value) => value.useDarkMode,));

    return MediaQuery.withNoTextScaling(
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ko', ''),
        ],
        theme: ThemeData(
          colorScheme: MaterialTheme.lightScheme(),
          fontFamily: 'SUITE',
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: MaterialTheme.lightScheme().outline, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MaterialTheme.lightScheme().primary, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MaterialTheme.lightScheme().outline, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        routerConfig: appRouter.config(),
        builder: (context, child) {
          return LoaderOverlay(child: child!);
        },
      ),
    );
  }
}
