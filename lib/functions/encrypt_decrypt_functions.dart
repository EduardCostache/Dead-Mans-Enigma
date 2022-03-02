import 'dart:developer';
import 'dart:io';
import 'package:dead_mans_enigma/widgets/alert_widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:encrypt/encrypt.dart';

class Enigma {
  void encrypt(String text, String keyAsString, List<File> files) async {
    final Key key = Key.fromUtf8(keyAsString.padRight(32, ' '));
    const String tradeMark = '[ecrypted_DME]';

    try {
      for (File file in files) {
        final contents = await file.readAsLines();
        // getting the name of the file without the extension
        final filename =
            p.basename(file.path).split('.').first + ' ' + tradeMark + '.txt';

        File encrypedFile = await File(p.join(await _localPath, filename))
            .create(recursive: true);

        var sink = encrypedFile.openWrite();

        for (String line in contents) {
          inspect(line);
          if (line == '') {
            sink.write('\n');
          } else {
            var encryptedLine = _aesEncryption(line, key);
            sink.write(encryptedLine + '\n');
          }
        }

        await sink.flush();
        await sink.close();
      }
    } catch (e) {
      //somethibng
      inspect(e);
    }

    //return encrypted.base64;
  }

  String _aesEncryption(String line, Key key) {
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(line, iv: iv);
    return encrypted.base16;
  }

  String decrypt(String text) {
    final key = Key.fromSecureRandom(16);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }

  Future<String> get _localPath async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final encyptedFilesDirectory =
        p.join(documentsDirectory.path, 'DME Encypted Files');

    return encyptedFilesDirectory;
  }
}
