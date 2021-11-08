import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GameEventVideoPlayer extends StatefulWidget {
  final videoUrl;
  const GameEventVideoPlayer(this.videoUrl);

  @override
  State<GameEventVideoPlayer> createState() => _GameEventVideoPlayerState();
}

class _GameEventVideoPlayerState extends State<GameEventVideoPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [
                VideoPlayer(_controller),
                //_ControlsOverlay(_controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ]),
            )
          : Container(),
      SizedBox(
        height: 4,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.seekTo(new Duration(seconds: 0));
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              fixedSize: MaterialStateProperty.all(Size(50, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70)))),
          child: Icon(
            Icons.fast_rewind,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.play();
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              fixedSize: MaterialStateProperty.all(Size(50, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70)))),
          child: Icon(
            Icons.play_arrow,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.pause();
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              fixedSize: MaterialStateProperty.all(Size(50, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70)))),
          child: Icon(
            Icons.pause,
          ),
        ),
      ]),
    ]);
  }
}
