import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var loading = false.obs;
  final ApiService apiService = ApiService();
  late BaseModel _baseModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  BaseModel? get baseModel => _baseModel;

  Future<void> register(
    String name,
    String email,
    String password,
    String role,
  ) async {
    try {
      _requestState = RequestState.loading;
      loading.value = true;
      update();
      final response = await apiService.fetchRegister(
        name,
        email,
        password,
        role,
      );
      if (response.statusCode == 201) {
        loading.value = false;
        _baseModel = response;
        _requestState = RequestState.success;
        update();
      } else {
        loading.value = false;
        _requestState = RequestState.error;
        _message = response.message;
        update();
      }
    } catch (e) {
      loading.value = false;
      _requestState = RequestState.error;
      _message = e.toString();
      update();
    }
  }
}
