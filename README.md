# flutter games

## What is this?

This is a WIP project playing around with WebRTC, WebSockets, [Flame](https://flame-engine.org/) (a Flutter Game Engine) and of course Flutter.

The code is neither well documented, tested, nor properly organized (yet).

## Goal

Provide a (hopefully) simple abstraction layer to be able to build Peer-to-Peer Games, so that the only server needed is a Signaling Server to build up the WebRTC connection. The most basic idea of this is already available inside the `games/game_base` folder and the `flutter-webrtc-server` folder, forked from [this](https://github.com/flutter-webrtc/flutter-webrtc-server) and modified to fit my needs.

Even though this is a private project and I probably won't work on this forever, and probably never even fully complete it, you can always feel free to contact me if you have any questions or ideas. (Try creating an issue first, then [email](mailto:nicolas@kedil.de?subject=[GitHub]%20Flutter%20Games) me)

## Project Structure

Signaling server: [flutter-webrtc-server](https://github.com/Niggelgame/flutter-games/blob/main/flutter-webrtc-server)

Flutter app: [games](https://github.com/Niggelgame/flutter-games/blob/main/games)
