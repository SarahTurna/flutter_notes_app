import 'package:flutter/material.dart';
import 'package:flutter_notes_app/controller/auth/login_controller.dart';
import 'package:flutter_notes_app/controller/auth/registration_controller.dart';
import 'package:flutter_notes_app/controller/home/notes_controller.dart';
import 'package:flutter_notes_app/helpers/app_routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const supabaseUrl = 'https://knnejqmablgbtqsshqpi.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => RegisterController());
  Get.lazyPut(() => NotesController());
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(428, 926),
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 300),
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
      ),
    );
  }
}
