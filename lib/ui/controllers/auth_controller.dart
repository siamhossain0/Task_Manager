import 'package:shared_preferences/shared_preferences.dart';

class AuthController {

  /*
  _accessTokenKey → এটা হচ্ছে একটি কনস্ট্যান্ট key যার মাধ্যমে SharedPreferences এ টোকেন সেভ/রিড করা হবে।

accessToken → একটি স্ট্যাটিক ভ্যারিয়েবল। অ্যাপ চলাকালীন ইন-মেমোরি (RAM) এ থাকবে যাতে বারবার SharedPreferences থেকে না নিতে হয়।


   */
  final String _accessTokenKey = 'access-token';
  static String? accessToken;
  /*
যখন ইউজার লগইন করে, তখন এই মেথড ব্যবহার করে তার access token টি ফোনে সেভ করা হয়।

২টি জায়গায় সেভ হয়:

ডিভাইসের লোকাল স্টোরেজে – SharedPreferences দিয়ে

মেমোরিতে – accessToken ভ্যারিয়েবলে

➡️ এতে করে পরেরবার অ্যাপ চালু হলে টোকেন মেমোরি থেকে পাওয়া যায়।
   */
  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken =token;
  }
 /*
অ্যাপ চালু হলে যদি আগে লগইন করা থাকে, তাহলে এই ফাংশন ব্যবহার করে access token আবার মেমোরিতে লোড করে।
ডেটা নেয় SharedPreferences থেকে, এবং accessToken এ সেট করে।
  */
  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token =  sharedPreferences.getString(_accessTokenKey);
    accessToken=token;
    return token;

  }
  /*
 এটিই চেক করে ইউজার লগইন করা আছে কিনা।
যদি accessToken মেমোরিতে পাওয়া যায় (null না হয়), তাহলে ইউজার লগইন করা।
   */
  bool isLogIn(){
return accessToken != null;
  }
/*
ইউজার যখন লগআউট করবে, তখন এই মেথড চলবে।
এটি:
লোকাল স্টোরেজ থেকে সব কিছু মুছে দেয় (অর্থাৎ লগআউট করে)
মেমোরি থেকেও accessToken null করে দেয়


 */
  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken =null;
  }
}
