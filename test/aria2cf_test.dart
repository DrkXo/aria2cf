import 'package:aria2cf/src/common/models/parser/parser.dart';
import 'package:aria2cf/src/features/aria2c_socket.dart';
import 'package:test/test.dart';

void main() async {
  test('Add Download', () async {
    Aria2cSocket aria2cSocket = Aria2cSocket();

    await aria2cSocket.connect().then((onValue) {
      /* aria2cSocket.sendData(
      request: Aria2cRequest.pauseAll(
        secret: 'flutter',
      ),
    );*/

      aria2cSocket.sendData(
        request: Aria2cRequest.addUrl(
          secret: 'flutter',
          urls: [
            'https://file-examples.com/storage/fe58a1f07d66f447a9512f1/2017/04/file_example_MP4_1920_18MG.mp4'
          ],
        ),
      );
    });
    expect(aria2cSocket._dataStream, emits(Aria2MethodResponse));
  });

  test('Get Version', () async {
    Aria2cSocket aria2cSocket = Aria2cSocket();

    await aria2cSocket.connect().then((onValue) {
      aria2cSocket.sendData(
        request: Aria2cRequest.getVersion(
          secret: 'flutter',
        ),
      );
    });

    expect(aria2cSocket._dataStream, emitsInAnyOrder([Aria2MethodResponse]));
    //aria2cSocket.disconnect();
  });
}
