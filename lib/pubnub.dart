
import 'dart:math';
import 'package:fallen_inc/puzzle/puzzle.dart';
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

  Stream? _mapStream, _playerStream, _sliderStream;

  void addMapListener(Function(dynamic) f){
    _mapStream!.listen(f);
  }

  void publishMap(Map message){
    _pubnub!.publish('$code/map', message);
  }

  void publishMapRequest(){
    _pubnub!.publish('$code/map', "request");
  }

  void addPlayerListener(Function(dynamic) f){
    _playerStream!.listen(f);
  }

  void publishPlayer(Map message){
    _pubnub!.publish('$code/player', message);
  }

  void addSliderListener(Function(dynamic) f){
    _sliderStream!.listen(f);
  }

  void publishSlider(Map message){
    _pubnub!.publish('$code/slider', message);
  }

  void setModeRequestSubscription(PuzzleMode mode){
    _pubnub!.subscribe(channels: {'$code/mode'}).messages.listen((envelope) {
      print("Received mode message");
      print(envelope.payload);
      if(envelope.payload == "request") {
        if(mode == PuzzleMode.slider) {
          _pubnub!.publish('$code/mode', "slider");
        } else if (mode == PuzzleMode.player) {
          _pubnub!.publish('$code/mode', "player");
        }
      }
    });
  }

  void setModeResponseSubscription(Function(dynamic) f){
    _pubnub!.subscribe(channels: {'$code/mode'}).messages.listen(f);
  }

  void sendModeRequest() {
    _pubnub!.publish('$code/mode', "request");
  }

  PubNubInteractor({this.code}){

    code ??= _generateRandomCode(4);

    assert(mono == null, "Can't have more than one PubNub instance");
    mono = this;

    _pubnub = pn.PubNub(defaultKeyset: myKeyset);


    _mapStream = _pubnub!.subscribe(channels: {'$code/map'}).messages;
    _playerStream = _pubnub!.subscribe(channels: {'$code/player'}).messages;
    _sliderStream = _pubnub!.subscribe(channels: {'$code/slider'}).messages;

  }

}