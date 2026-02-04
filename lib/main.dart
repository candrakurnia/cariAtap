import 'package:cari_atap/controllers/confirmation_controller.dart';
import 'package:cari_atap/controllers/home_controller.dart';
import 'package:cari_atap/controllers/login_controller.dart';
import 'package:cari_atap/controllers/register_controller.dart';
import 'package:cari_atap/presentation/confirm_feature/confirm_screen.dart';
import 'package:cari_atap/presentation/login_feature/login_screen.dart';
import 'package:cari_atap/presentation/main_navigation_screen.dart';
import 'package:cari_atap/presentation/register_feature.dart/register_screen.dart';
import 'package:cari_atap/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginController loginController = Get.put(LoginController());
  RegisterController registerController = Get.put(RegisterController());
  ConfirmationController confirmationController = Get.put(ConfirmationController());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cari Atap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/register", page: () => const RegisterScreen()),
        GetPage(name: "/confirm", page: () => ConfirmScreen(confirmationId: registerController.baseModel?.data?.user?.confirmationId ?? "")),
        GetPage(name: "/main", page: () => const MainNavigationScreen()),
      ],
    );
  }
}
