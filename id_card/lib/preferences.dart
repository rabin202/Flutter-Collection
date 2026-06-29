import 'package:shared_preferences/shared_preferences.dart';



Future<void> setTheme(String newTheme) async
{
  final SharedPreferences preference  = await SharedPreferences.getInstance();

  await preference.setString("theme", newTheme);
}

Future<String> getTheme() async
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('theme') ?? 'light';

}
