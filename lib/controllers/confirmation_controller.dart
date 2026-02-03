import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/base_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConfirmationController extends GetxController {
  final ApiService apiService = ApiService();
  late BaseModel _baseModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  BaseModel? get baseModel => _baseModel;

  Future<void> confirm(String confirmationId) async {
    try {
      _requestState = RequestState.loading;
      update();
      final response = await apiService.fetchConfirmation(confirmationId);
      if (response.statusCode == 200) {
        _baseModel = response;
        _requestState = RequestState.success;
        update();
      } else {
        _requestState = RequestState.error;
        _message = response.message;
        update();
      }
    }
    catch (e) {
      _requestState = RequestState.error;
      _message = e.toString();
      update();
    }
  }
}