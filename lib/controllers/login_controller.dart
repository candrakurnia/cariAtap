import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/base_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  final ApiService apiService = ApiService();
  late BaseModel _baseModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  BaseModel? get baseModel => _baseModel;

  Future<void> login(String email, String password) async {
    try {
      _requestState = RequestState.loading;
      loading.value = true;
      update();
      final response = await apiService.fetchLogin(email, password);
      if (response.statusCode == 200) {
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
