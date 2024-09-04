import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:note_app/config/scroll.dart';
import 'package:note_app/config/system_overlay.dart';
import 'package:note_app/config/theme.dart';
import 'package:note_app/features/note/view/screens/edit_note_screen.dart';
import 'package:note_app/features/home/view/screens/home_layout.dart';
import 'package:note_app/features/note/view/screens/notes_screen.dart';
import 'package:note_app/features/onboard/screen/onboard_screen.dart';
import 'package:note_app/features/home/view/screens/tip_screen.dart';

import 'controller/note_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    executeSystemOverlay();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: NoteBindings(),
          initialRoute: "/onboard",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          scrollBehavior: const MyScrollBehavior(),
          theme: KTheme.lightMode,
          darkTheme: KTheme.darkMode,
          home: const OnboardingScreen(),
          getPages: [
            GetPage(
              name: "/onboard",
              page: () => const OnboardingScreen(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: "/note",
              page: () => const NoteScreen(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: "/editNote",
              page: () => const EditNoteScreen(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: "/home",
              page: () => const HomeScreen(),
              transition: Transition.fadeIn,
            ),
            GetPage(
              name: "/tip",
              page: () => const TipScreen(),
              transition: Transition.fadeIn,
            ),
          ],
        );
      },
    );
  }
}

