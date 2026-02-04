import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();
  var loading = false.obs;
  HomeModel? _homeModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  HomeModel? get homeModel => _homeModel;

  Future<dynamic> fetchHome(String query) async {
    try {
      _requestState = RequestState.loading;
      loading.value = true;
      update();
      final response = await apiService.fetchHome(query);
      if (response.statusCode == 200) {
        loading.value = false;
        _requestState = RequestState.success;
        update();
        return _homeModel = response;
        
      } else {
        loading.value = false;
        _requestState = RequestState.error;
        _message = response.message;
        update();
      }
    } catch (e) {
      loading.value = false;
      _requestState = RequestState.error;
      _message = e.toString().replaceFirst('Exception: ', '');
      update();
    }
  }
}
