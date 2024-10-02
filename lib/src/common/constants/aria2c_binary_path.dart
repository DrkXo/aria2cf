import 'dart:io';

import 'package:aria2cf/src/utils/logger.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class Aria2cBinaryPath {
  final String platform = Platform.operatingSystem;
  final String _android = '/data/data/your.package.name/files/aria2c';
  final String _linux = 'assets/aria2c/linux/x64/aria2c';
  final String _windows = 'assets/aria2c/windows/x64/aria2c.exe';
  final String _macos = 'assets/aria2c/macos/aria2c';

  /// Retrieves the path to the aria2c binary based on the platform
  Future<String?> getAria2cBinaryPath() async {
    String assetPath;
    String fileName;

    if (Platform.isWindows) {
      assetPath = _windows;
      fileName = 'aria2c.exe';
    } else if (Platform.isLinux) {
      assetPath = _linux;
      fileName = 'aria2c';
    } else if (Platform.isMacOS) {
      assetPath = _macos;
      fileName = 'aria2c';
    } else if (Platform.isAndroid) {
      assetPath = _android;
      fileName = 'aria2c';
    } else {
      logger('Unsupported platform: ${Platform.operatingSystem}');
      return null;
    }

    try {
      // On mobile platforms, copy the binary to a temporary writable directory
      final directory = await _getWritableDirectory();
      final binaryPath = path.join(directory.path, fileName);

      // Load the binary from assets and write to the file system
      final byteData = await rootBundle.load(assetPath);
      final buffer = byteData.buffer.asUint8List();
      final file = File(binaryPath);
      await file.writeAsBytes(buffer, flush: true);

      // Make the binary executable (for Unix-like platforms)
      if (!Platform.isWindows) {
        await Process.run('chmod', ['+x', binaryPath]);
      }

      logger('Binary copied to: $binaryPath');
      return binaryPath;
    } catch (e) {
      logger('Failed to load aria2c binary from assets: $e');
      return null;
    }
  }

  /// Gets a writable directory (e.g., temporary directory) for copying the binary
  Future<Directory> _getWritableDirectory() async {
    if (Platform.isAndroid || Platform.isIOS) {
      return await getTemporaryDirectory(); // Use the temporary directory for mobile
    } else {
      return Directory.systemTemp; // Use system temp on desktop platforms
    }
  }
}
