// views/register/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/controller/auth/registration_controller.dart'; // Import your RegisterController
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/icons/caretutors-blue.svg',
              height: 100.h,
              width: 100.w,
            ),
            SizedBox(height: 30.h),
            Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF357ec5)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15.h),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF357ec5)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(height: 15.h),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF357ec5)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30.h),
            Obx(
              () => ElevatedButton(
                onPressed:
                    controller.isLoading.value
                        ? null
                        : () {
                          controller.register(context);
                        },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: const Color(0xFF007BFF),
                ),
                child:
                    controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: const Text(
                    'Sign In!',
                    style: TextStyle(color: Color(0xFF357ec5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
