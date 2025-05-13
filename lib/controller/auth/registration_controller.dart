import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> register(BuildContext context) async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    isLoading.value = true;
    try {
      final AuthResponse res = await _supabaseClient.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      if (res.user != null) {
        Get.snackbar('Success', 'Registration successful!');
        GoRouter.of(context).goNamed('home');
      } else {
        Get.snackbar('Error', 'Registration failed.');
      }
    } on AuthException catch (error) {
      Get.snackbar('Error', 'Registration failed: ${error.message}');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
