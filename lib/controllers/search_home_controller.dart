import 'package:cari_atap/api/api_service.dart';
import 'package:cari_atap/common/state_enum.dart';
import 'package:cari_atap/model/home_model.dart';
import 'package:get/get.dart';

class SearchHomeController extends GetxController {
  var loading = false.obs;
  final ApiService apiService = ApiService();
  late HomeModel _homeModel;
  RequestState? _requestState;
  String? _message;

  String? get message => _message;
  RequestState? get requestState => _requestState;
  HomeModel? get homeModel => _homeModel;

  Future<dynamic> searchHome(String query) async {
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
        update();
        return _message = response.message;
      }
    } catch (e) {
      loading.value = false;
      _requestState = RequestState.error;
      _message = e.toString().replaceFirst('Exception: ', '');
      update();
    }
  }
}