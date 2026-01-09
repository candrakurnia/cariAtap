import 'dart:convert';
import 'package:cari_atap/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var loading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      loading.value = true;
      
      final response = await http.post(
        Uri.parse('http://35.225.241.252:3000/user/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = baseModelFromJson(response.body);
        if (data.statusCode == 200) {
          Get.snackbar(
            "Success",
            "Login berhasil",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAllNamed("/main");
        } else {
          Get.snackbar(
            "Error",
            data.message ?? "Terjadi kesalahan",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        try {
          final errorData = baseModelFromJson(response.body);
          Get.snackbar(
            "Error",
            errorData.message ?? "Login gagal. Silakan coba lagi.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } catch (_) {
          Get.snackbar(
            "Error",
            "Login gagal. Status code: ${response.statusCode}",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }
}
