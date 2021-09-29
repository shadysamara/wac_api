import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper {
  SharedPrefrencesHelper._();
  static SharedPrefrencesHelper sharedPrefrencesHelper =
      SharedPrefrencesHelper._();
  SharedPreferences sharedPrefrences;
  initSharedPrefrences() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  setToken(String token) async {
    await sharedPrefrences.setString('token', token);
  }

  String getToken() {
    return sharedPrefrences.getString('token');
  }
}
