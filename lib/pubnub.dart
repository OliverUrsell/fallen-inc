
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

  List<pn.Subscription> subscriptions = [];

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

  Stream subscribe(String channel){
    pn.Subscription subscription = _pubnub!.subscribe(channels: {channel});
    subscriptions.add(subscription);
    return subscription.messages;
  }

  void cancelAllSubscriptions(){
    for (pn.Subscription subscription in subscriptions) {
      subscription.cancel();
    }
  }

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
    subscribe('$code/mode').listen((envelope) {
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
    subscribe('$code/mode').listen(f);
  }

  void sendModeRequest() {
    _pubnub!.publish('$code/mode', "request");
  }

  PubNubInteractor({this.code}){

    code ??= _generateRandomCode(4);

    if(mono != null) mono!.cancelAllSubscriptions();

    mono = this;

    _pubnub = pn.PubNub(defaultKeyset: myKeyset);


    _mapStream = subscribe('$code/map');
    _playerStream = subscribe('$code/player');
    _sliderStream = subscribe('$code/slider');

  }

}