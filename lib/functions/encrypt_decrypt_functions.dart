import 'dart:developer';
import 'dart:io';
import 'package:dead_mans_enigma/providers/file_processing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:encrypt/encrypt.dart' as e;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class Enigma {
  Future<void> encrypt(
      String keyAsString, List<File> files, BuildContext context) async {
    final String encryptedPath = p.join(await _localPath, 'encrypted');
    final e.Key key = e.Key.fromUtf8(keyAsString.padRight(32, ' '));

    final double _incrementProgressStep = 100 / files.length;

    try {
      for (File file in files) {
        final contents = await file.readAsLines();
        // getting the name of the file without the extension
        final filename = p.basename(file.path);

        Provider.of<FileProcessor>(context, listen: false)
            .updateFilename(filename);

        File encrypedFile =
            await File(p.join(encryptedPath, filename)).create(recursive: true);

        var sink = encrypedFile.openWrite();

        for (String line in contents) {
          if (line == '') {
            sink.writeln();
          } else {
            var encryptedLine = _aesEncryption(line, key);
            sink.writeln(encryptedLine);
          }
        }

        Provider.of<FileProcessor>(context, listen: false)
            .incrementProgress(_incrementProgressStep);

        await sink.flush();
        await sink.close();
      }
    } catch (e) {
      //somethibng
      inspect(e);
    }
  }

  Future<void> decrypt(String keyAsString, List<File> files) async {
    final String decryptedPath = p.join(await _localPath, 'decrypted');
    final e.Key key = e.Key.fromUtf8(keyAsString.padRight(32, ' '));

    try {
      for (File file in files) {
        final encryptedLines = await file.readAsLines();
        // getting the name of the file without the extension
        final filename = p.basename(file.path);

        File decrypedFile =
            await File(p.join(decryptedPath, filename)).create(recursive: true);

        var sink = decrypedFile.openWrite();

        for (String line in encryptedLines) {
          if (line == '') {
            sink.writeln();
          } else {
            var decryptedLine = _aesDecryption(line, key);
            sink.writeln(decryptedLine);
          }
        }

        await sink.flush();
        await sink.close();
      }
    } catch (e) {
      inspect(e);
    }
  }

  String _aesEncryption(String line, e.Key key) {
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key));
    final encrypted = encrypter.encrypt(line, iv: iv);
    return encrypted.base16;
  }

  String _aesDecryption(String encryptedLine, e.Key key) {
    final iv = e.IV.fromLength(16);
    final encrypter = e.Encrypter(e.AES(key));
    final decrypted =
        encrypter.decrypt(e.Encrypted.fromBase16(encryptedLine), iv: iv);

    return decrypted;
  }

  Future<String> get _localPath async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final encyptedFilesDirectory =
        p.join(documentsDirectory.path, "Dead Man's Enigma Output");

    return encyptedFilesDirectory;
  }
}
