
import 'dart:math';
import 'package:pubnub/pubnub.dart' as pn;

class PubNubInteractor {

  static PubNubInteractor? mono;

  String? code;

  final myKeyset = pn.Keyset(
      subscribeKey: 'sub-c-33837192-a246-11ec-a074-1a3740267833',
      publishKey: 'pub-c-a2d64384-6c4d-4358-a2f7-e8db9e746dee',
      uuid: const pn.UUID('sub-c-33837192-a246-11ec-a074-1a3740267833'));

  pn.PubNub? _pubnub;

  String _generateRandomCode(int length) {

    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }

  Stream? _mapStream;

  void addMapListener(Function(dynamic) f){
    _mapStream!.listen(f);
  }

  void publishMap(Map message){
    print("Publishing map");
    _pubnub!.publish('$code/map', message);
  }

  void publishMapRequest(){
    print("Published Request");
    _pubnub!.publish('$code/map', "request");
  }

  PubNubInteractor({this.code}){

    code ??= _generateRandomCode(4);

    assert(mono == null, "Can't have more than one PubNub instance");
    mono = this;

    _pubnub = pn.PubNub(defaultKeyset: myKeyset);


    _mapStream = _pubnub!.subscribe(channels: {'${code}/map'}).messages;

  }

}