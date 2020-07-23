import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AppPlayer extends StatefulWidget {
  final String audioFilePath;
  final String basePath;

  AppPlayer({
    this.audioFilePath,
    this.basePath,
  });

  @override
  _AppPlayerState createState() => _AppPlayerState();
}

class _AppPlayerState extends State<AppPlayer> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return AudioWidget.assets(
      path: '${this.widget.basePath}/${this.widget.audioFilePath}',
      play: _play,
      child: IconButton(
          icon: Icon(
            _play ? Icons.pause_circle_outline : Icons.play_circle_outline,
          ),
          iconSize: 46,
          color: Color(0XFF0064A0).withOpacity(0.9),
          onPressed: () {
            setState(() {
              _play = !_play;
            });
          }),
      onReadyToPlay: (duration) {
        //onReadyToPlay
      },
      onPositionChanged: (current, duration) {
        //onReadyToPlay
      },
    );
  }
}
