import 'package:aria2cf/src/common/models/parser/parser.dart';
import 'package:aria2cf/src/features/aria2c_socket.dart';
import 'package:aria2cf/src/utils/logger.dart';

main() async {
  Aria2cSocket aria2cSocket = Aria2cSocket();

  await aria2cSocket.connect().then((onValue) {
    aria2cSocket.sendData(
      request: Aria2cRequest.getVersion(
        secret: 'flutter',
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
  );
}
