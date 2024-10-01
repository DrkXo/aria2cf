import 'dart:io';

class Aria2cBinaryPath {
  final String platform = Platform.operatingSystem;
  final String _android = '/data/data/your.package.name/files/aria2c';
  final String _linux = 'assets/aria2c/linux/x64/aria2c';
  final String _windows = 'assets/aria2c/windows/x64/aria2c.exe';
  final String _macos = 'assets/aria2c/macos/aria2c';

  String get getPlatformPath {
    if (platform == 'android') {
      return _android; // Example path for Android
    } else if (platform == 'linux') {
      return _linux;
    } else if (platform == 'windows') {
      return _windows;
    } else if (platform == 'macos') {
      return _macos;
    } else {
      throw UnsupportedError('Unsupported platform: $platform');
    }
  }
}
