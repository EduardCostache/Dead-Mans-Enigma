import 'dart:developer';

import 'package:encrypt/encrypt.dart';

class Enigma {
  String encrypt(String text, String keyAsString) {
    final key = Key.fromUtf8(keyAsString.padRight(32, ' '));
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);

    inspect(key);

    return encrypted.base64;
  }

  String decrypt(String text) {
    final key = Key.fromSecureRandom(16);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}
