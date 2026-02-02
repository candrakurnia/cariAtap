import 'dart:convert';

import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  var loading = false.obs;
  final ApiService apiService = ApiService();
  late BaseModel _baseModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  BaseModel? get baseModel => _baseModel;

  Future<void> register(String name, String email, String password, String role) async {
    try {
      _requestState = RequestState.loading;
      update();
      final response = await apiService.fetchRegister(name, email, password, role);
      if (response.statusCode == 201) {
        _baseModel = response;
        _requestState = RequestState.success;
        update();
        Get.offAllNamed("/login");
      } else {
        _requestState = RequestState.error;
        _message = response.message;
        update();
      }
    } catch (e) {
      _requestState = RequestState.error;
      _message = e.toString();
      update();
    }
  }
  // Future<void> register(String name, String email, String password, String role) async {
  //   try {
  //     loading.value = true;
  //     final response = await http.post(
  //       Uri.parse('http://35.225.241.252:3000/user/register'),
  //       body: jsonEncode({
  //         'name': name,
  //         'email': email,
  //         'password': password,
  //         'role': role,
  //       }),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //     if (response.statusCode == 201) {
  //       final data = baseModelFromJson(response.body);
  //       print("data: ${data.data?.user?.confirmationId}");
  //       if (data.statusCode == 201) {
  //         Get.snackbar(
  //           "Success",
  //           "Register berhasil",
  //           backgroundColor: Colors.green,
  //           colorText: Colors.white,
  //         );
  //         Get.offAllNamed("/login");
  //       } else {
  //         Get.snackbar(
  //           "Error",
  //           data.message ?? "Terjadi kesalahan",
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //         );
  //       }
  //     } else {
  //       try {
  //         final errorData = baseModelFromJson(response.body);
  //         Get.snackbar(
  //           "Error",
  //           errorData.message ?? "Register gagal. Silakan coba lagi.",
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //         );
  //       } catch (_) {
  //         Get.snackbar(
  //           "Error",
  //           "Register gagal. Status code: ${response.statusCode}",
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "Terjadi kesalahan: ${e.toString()}",
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     loading.value = false;
  //   }
  // }
}