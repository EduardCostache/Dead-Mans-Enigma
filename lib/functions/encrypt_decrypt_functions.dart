import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:dead_mans_enigma/providers/file_processing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:encrypt/encrypt.dart' as e;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class Enigma {
  Future<void> enigma(String keyAsString, List<File> files,
      BuildContext context, bool mode) async {
    // mode == false : encrypt
    // mode == true : decrypt
    final String newFilesPath = mode
        ? p.join(await _localPath, 'decrypted')
        : p.join(await _localPath, 'encrypted');
    final e.Key key = e.Key.fromUtf8(keyAsString.padRight(32, ' '));

    final double _incrementProgressStep = roundDouble(100.0 / files.length, 2);

    var fileProvider =
        Provider.of<FileProgressProvider>(context, listen: false);

    try {
      for (File file in files) {
        final contents = await file.readAsLines();
        // getting the name of the file without the extension
        final filename = p.basename(file.path);

        fileProvider.updateFilename(filename);

        File newFile =
            await File(p.join(newFilesPath, filename)).create(recursive: true);

        var sink = newFile.openWrite();

        for (String line in contents) {
          if (line == '') {
            sink.writeln();
          } else {
            var newLine =
                mode ? _aesDecryption(line, key) : _aesEncryption(line, key);
            sink.writeln(newLine);
          }
        }

        fileProvider.updateProgress(_incrementProgressStep);

        await sink.flush();
        await sink.close();
      }
    } catch (e) {
      //somethibng
      inspect(e);
    }
  }

  String _aesEncryption(String line, e.Key key) {
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key, padding: null));
    final encrypted = encrypter.encrypt(line, iv: iv);
    return encrypted.base16;
  }

  String _aesDecryption(String encryptedLine, e.Key key) {
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key, padding: null));
    final decrypted =
        encrypter.decrypt(e.Encrypted.fromBase16(encryptedLine), iv: iv);

    return decrypted;
  }

  double roundDouble(double value, int places) {
    var mod = pow(10, places);
    return ((value * mod).round().toDouble() / mod);
  }

  Future<String> get _localPath async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final encyptedFilesDirectory =
        p.join(documentsDirectory.path, "Dead Man's Enigma Output");

    return encyptedFilesDirectory;
  }
}
