import 'package:aria2cf/aria2cf.dart';
import 'package:aria2cf/src/utils/logger.dart';

main() async {
  String secret = 'shed';

  Aria2cSocket aria2cSocket = Aria2cSocket();

  await aria2cSocket.connect().then((onValue) async {
    /* aria2cSocket.methodStream.listen((onData) {
      logger('methodStream');
      logger(onData);
    });
    aria2cSocket.errorStream.listen((onData) {
      logger('errorStream');
      logger(onData);
    });
    aria2cSocket.notificationStream.listen((onData) {
      logger('notificationStream');
      logger(onData);
    }); */

    aria2cSocket.aria2cGetSessionInfoStream.listen((onData) {
      logger('aria2cVersion');
      logger(onData);
    });

    /* aria2cSocket.dataStream.listen(
      (onData) {
        logger('DataStream|Data');
        logger(onData.toString());

        final data = onData;

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
    );
 */
    aria2cSocket.sendData(
      request: Aria2cRequest.getSessionInfo(
        secret: secret,
      ),
    );

    aria2cSocket.sendData(
      request: Aria2cRequest.tellActive(
        secret: secret,
      ),
    );

    /*  aria2cSocket.sendData(
      request: Aria2cRequest.addUrl(
        secret: secret,
        urls: [
          'https://file-examples.com/storage/fe58a1f07d66f447a9512f1/2017/04/file_example_MP4_1920_18MG.mp4'
        ],
      ),
    ); */

    /* while (true) {
      await Future.delayed(const Duration(seconds: 2)).then((onValue) {
        aria2cSocket.sendData(
          request: Aria2cRequest.tellActive(
            secret: secret,
          ),
        );
      });
    } */
  });
}
