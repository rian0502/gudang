
import 'package:shared_preferences/shared_preferences.dart';

class SimasChace{
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}