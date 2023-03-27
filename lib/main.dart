import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentations/pages/lobby_page.dart';
import 'presentations/pages/signin_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'AI Word Chain';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF005FB1),
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFD3E3FF),
          onPrimaryContainer: Color(0xFF001C3B),
          secondary: Color(0xFF555F71),
          onSecondary: Colors.white,
          secondaryContainer: Color(0xFFD8E3F8),
          onSecondaryContainer: Color(0xFF121C2B),
          tertiary: Color(0xFF6E5676),
          onTertiary: Colors.white,
          tertiaryContainer: Color(0xFFF7D8FF),
          onTertiaryContainer: Color(0xFF271330),
          error: Color(0xFFBA1B1B),
          onError: Colors.white,
          errorContainer: Color(0xFFFFDAD4),
          onErrorContainer: Color(0xFF410001),
          background: Color(0xFFFDFBFF),
          onBackground: Color(0xFF1B1B1D),
          surface: Color(0xFFFDFBFF),
          onSurface: Colors.white,
          inverseSurface: Color(0xFF2F3033),
          onInverseSurface: Color(0xFFF1F0F4),
          inversePrimary: Color(0xFFA4C8FF),
          surfaceVariant: Color(0xFFDFE2EB),
          onSurfaceVariant: Color(0xFF43474E),
          outline: Color(0xFF74777F),
          shadow: Color(0xFF000000),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFFA4C8FF),
          onPrimary: Color(0xFF003060),
          primaryContainer: Color(0xFF004788),
          onPrimaryContainer: Color(0xFFD3E3FF),
          secondary: Color(0xFFBCC7DC),
          onSecondary: Color(0xFF273141),
          secondaryContainer: Color(0xFF3D4758),
          onSecondaryContainer: Color(0xFFD8E3F8),
          tertiary: Color(0xFFDABDE2),
          onTertiary: Color(0xFF3D2846),
          tertiaryContainer: Color(0xFF553F5D),
          onTertiaryContainer: Color(0xFFF7D8FF),
          error: Color(0xFFFFB4A9),
          onError: Color(0xFF680003),
          errorContainer: Color(0xFF930006),
          onErrorContainer: Color(0xFFFFB4A9),
          background: Color(0xFF1B1B1D),
          onBackground: Color(0xFFE3E2E6),
          surface: Color(0xFF1B1B1D),
          onSurface: Color(0xFFE3E2E6),
          inverseSurface: Color(0xFFE3E2E6),
          onInverseSurface: Color(0xFF2F3033),
          inversePrimary: Color(0xFF005FB1),
          surfaceVariant: Color(0xFF43474E),
          onSurfaceVariant: Color(0xFFC3C6CF),
          outline: Color(0xFF8E919A),
          shadow: Color(0xFF000000),
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        '/': (context) => const SignInPage(),
        '/lobby': (context) => const LobbyPage(),
      },
    );
  }
}
