import 'dart:developer';

import 'package:encrypt/encrypt.dart';

class Encryption {
  String encrypt(String text) {
    final key = Key.fromSecureRandom(16);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    //final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return encrypted.base64;
  }
}
