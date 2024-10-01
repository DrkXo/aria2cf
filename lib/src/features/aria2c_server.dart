import 'dart:io';

import 'package:aria2cf/src/common/constants/aria2c_binary_path.dart';
import 'package:aria2cf/src/utils/logger.dart';

class Aria2cService {
  final Aria2cBinaryPath binaryPath = Aria2cBinaryPath();
  String secretToken;
  Process? _aria2cProcess;
  int? _processId;

  // Singleton instance
  static final Aria2cService _instance =
      Aria2cService._internal(secretToken: 'default_token');

  // Named constructor for singleton
  Aria2cService._internal({required this.secretToken});

  // Factory constructor that always returns the same instance
  factory Aria2cService({required String secretToken}) {
    _instance.secretToken = secretToken;
    return _instance;
  }

  // Method to start the aria2c RPC server
  Future<void> start() async {
    if (_aria2cProcess != null) {
      logger('aria2c is already running.');
      return;
    }

    String binaryPath = this.binaryPath.getPlatformPath;

    if (Platform.isLinux || Platform.isMacOS || Platform.isAndroid) {
      await Process.run('chmod', ['+x', binaryPath]);
    }

    final List<String> arguments = [
      '--enable-rpc',
      '--rpc-listen-all=true',
      '--rpc-secret=$secretToken',
      '--rpc-allow-origin-all',
    ];

    logger('Starting aria2c process with binary: $binaryPath');
    _aria2cProcess = await Process.start(binaryPath, arguments);

    _processId = _aria2cProcess!.pid;
    logger('aria2c started with PID: $_processId');

    _aria2cProcess!.stdout.transform(SystemEncoding().decoder).listen((output) {
      logger('aria2c output: $output');
    });

    _aria2cProcess!.stderr.transform(SystemEncoding().decoder).listen((error) {
      logger('aria2c error: $error');
    });

    _aria2cProcess!.exitCode.then((code) {
      logger('aria2c exited with code: $code');
      _aria2cProcess = null;
      _processId = null;
    });
  }

  // Method to stop the aria2c process by PID or instance
  Future<void> stop() async {
    if (_processId == null) {
      logger('No aria2c process is running.');
      return;
    }

    logger('Stopping aria2c process with PID: $_processId');
    _killProcessById(_processId!);

    _processId = null;
    _aria2cProcess = null;
  }

  // Utility function to kill the process by PID (cross-platform)
  void _killProcessById(int pid,
      {ProcessSignal signal = ProcessSignal.sigkill}) {
    try {
      if (Platform.isWindows) {
        // On Windows, we use taskkill command to kill the process
        Process.runSync('taskkill', ['/F', '/PID', pid.toString()]);
      } else {
        // On Unix-based systems including Android, use killPid with ProcessSignal
        Process.killPid(pid, signal);
      }
      logger('Killed process with PID: $pid');
    } catch (e) {
      logger('Failed to kill process with PID: $pid. Error: $e');
    }
  }

  // Method to check if the aria2c process is running
  bool isRunning() {
    return _processId != null &&
        Process.killPid(_processId!, ProcessSignal.sigterm);
  }

  // Static method to find existing aria2c processes and their PIDs
  static List<int> findRunningProcesses() {
    List<int> pids = [];
    try {
      if (Platform.isWindows) {
        var result = Process.runSync('tasklist', []);
        if (result.stdout.toString().contains('aria2c.exe')) {
          var lines = result.stdout.toString().split('\n');
          for (var line in lines) {
            if (line.startsWith('aria2c.exe')) {
              var pid = line.split(RegExp(r'\s+'))[1];
              pids.add(int.parse(pid));
            }
          }
        }
      } else {
        var result = Process.runSync('ps', ['aux']);
        if (result.stdout.toString().contains('aria2c')) {
          var lines = result.stdout.toString().split('\n');
          for (var line in lines) {
            if (line.contains('aria2c')) {
              var pid = line.split(RegExp(r'\s+'))[1];
              pids.add(int.parse(pid));
            }
          }
        }
      }
    } catch (e) {
      logger('Failed to find aria2c processes. Error: $e');
    }
    return pids;
  }

  // Method to attach to an existing process by PID
  void attachToProcess(int pid) {
    if (Process.killPid(pid, ProcessSignal.sigterm)) {
      _processId = pid;
      logger('Attached to aria2c process with PID: $_processId');
    } else {
      logger('No process found with PID: $pid');
    }
  }
}
