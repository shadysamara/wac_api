import 'package:dio/dio.dart';
import 'package:wac_coaching/auth/models/register_request.dart';
import 'package:wac_coaching/auth/models/register_response.dart';
import 'package:wac_coaching/shared_prefrences_helper.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      Response response = await dio.post('https://hotflix.club/api/register',
          data: registerRequest.toMap());
      if (response.data['message']['error'] != null) {
        return null;
      } else {
        RegisterResponse registerResponse =
            RegisterResponse.fromJson(response.data);
        SharedPrefrencesHelper.sharedPrefrencesHelper
            .setToken(registerResponse.data.accessToken);
        return registerResponse;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RegisterResponse> login(String userName, String password) async {
    try {
      Response response = await dio.post('https://hotflix.club/api/login',
          data: {'username': userName, 'password': password});
      if (response.data['message']['error'] != null) {
        return null;
      } else {
        RegisterResponse registerResponse =
            RegisterResponse.fromJson(response.data);
        SharedPrefrencesHelper.sharedPrefrencesHelper
            .setToken(registerResponse.data.accessToken);
        return registerResponse;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<bool> forgetPassword(String oldPassword, String newPassword) async {
    try {
      String token = SharedPrefrencesHelper.sharedPrefrencesHelper.getToken();
      Response response =
          await dio.post('https://hotflix.club/api/user/change-password',
              data: {
                'current_password': oldPassword,
                'password': newPassword,
                'password_confirmation': newPassword
              },
              options: Options(headers: {'Authorization': 'Bearer  $token'}));
      print(response.data);
      if (response.data['message']['error'] != null) {
        return false;
      } else {
        return true;
      }
    } on Exception catch (e) {
      // TODO
    }
  }
}
