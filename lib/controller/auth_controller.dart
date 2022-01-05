import 'dart:async';

class AuthController {
  static Completer<bool> authMeCompleter = Completer<bool>();

  static Future<bool> authMe() async {
    return authMeCompleter.future;
  }
}
