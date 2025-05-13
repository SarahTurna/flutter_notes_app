import 'package:flutter_notes_app/view/auth/login_screen.dart';
import 'package:flutter_notes_app/view/auth/register_screen.dart';
import 'package:flutter_notes_app/view/home/add_notes_screen.dart';
import 'package:flutter_notes_app/view/home/home_screen.dart';
import 'package:flutter_notes_app/view/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: 'add-note',
      path: '/add-note',
      builder: (context, state) => const AddNoteScreen(),
    ),
  ],
);
