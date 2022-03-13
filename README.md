# Fallen Inc

This is an entry for the [Flutter Puzzle Hack](https://flutterhack.devpost.com/) play as Arella or
Sofia. Arella moves through the map to reach the elevator goal. Sofia moves the tiles on the board
to guide Arella to the exit

## Installing
This project requires [PubNub API](https://www.pubnub.com) keys to run from scratch, register as an account
and replace `myKeyset` in `lib/pubnub.dart` as described in the 
[PubNub Dart package page](https://pub.dev/packages/pubnub).

Run `flutter pub get` from the root directory to install required packages

## Running
Run `flutter run -d web-server` to start a debug server, visit the link in stout to view the project.

## Deployment
Run `flutter build web` to build the web server, then, in `build/web` run `python -m http.server 8000`
to start a http server, now visiting `localhost:8000` will run the project.
