import 'package:shared_preferences/shared_preferences.dart';

Future<void> setLoginDetails(
    bool isLoggedIn, String email, String userName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', isLoggedIn);
  await prefs.setString('userEmail', email);
  await prefs.setString('userName', userName);
}

Future<bool> getLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

Future<String?> getUserEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userEmail');
}

Future<String?> getUserName() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('userName');
}

Future<void> clearLoginDetails() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('isLoggedIn');
  await prefs.remove('userEmail');
  await prefs.remove('userName');
}
