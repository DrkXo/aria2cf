import 'package:aria2cf/src/features/aria2c_server.dart';
import 'package:aria2cf/src/utils/logger.dart';

main() async {
  String secret = 'flutter';

  final aria2cService = Aria2cService(
    secretToken: secret,
  );

  // Find any existing aria2c processes and attach to the first one
  List<int> runningProcesses = Aria2cService.findRunningProcesses();
  if (runningProcesses.isNotEmpty) {
    logger('Found running aria2c process with PID: ${runningProcesses.first}');
    aria2cService.attachToProcess(runningProcesses.first);
  } else {
    // Start a new aria2c process if no existing ones are found
    await aria2cService.start();
  }

  // Check if the server is running
  if (aria2cService.isRunning()) {
    logger('aria2c is running');
  }

  // Stop the aria2c process after some time (e.g., 10 seconds)
  await Future.delayed(Duration(seconds: 10));
  await aria2cService.stop();

  // Check if the server has stopped
  if (!aria2cService.isRunning()) {
    logger('aria2c has stopped');
  }

/*   Aria2cSocket aria2cSocket = Aria2cSocket();

  await aria2cSocket.connect().then((onValue) {
    aria2cSocket.sendData(
      request: Aria2cRequest.getVersion(
        secret: secret,
      ),
    );

    /* aria2cSocket.sendData( 
      request: Aria2cRequest.addUrl(
        secret: 'flutter',
        urls: [
          'https://file-examples.com/storage/fe58a1f07d66f447a9512f1/2017/04/file_example_MP4_1920_18MG.mp4'
        ],
      ),
    ); */
  });

  aria2cSocket.dataStream.listen(
    (onData) {
      logger('DataStream|Data');
      logger(onData.toString());

      Aria2MethodResponse data = onData;

      logger(data);
    },
    onError: (onError) {
      logger('DataStream|Error');
      logger(onError.toString());
      logger(onError.runtimeType);
    },
    onDone: () {
      logger('DataStream|Done');
    },
  ); */
}
