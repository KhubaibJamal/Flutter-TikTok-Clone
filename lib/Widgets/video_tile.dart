import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_clone/Models/video.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile(
      {Key? key,
      required this.video,
      required this.snappedPageIndex,
      required this.currentIndex})
      : super(key: key);
  final Video video;
  final int snappedPageIndex;
  final int currentIndex;

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _videoController;
  late Future _InitializeVideoPlayer;
  bool _isVideoPlay = true;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.asset('assets/${widget.video.videoURL}');
    _InitializeVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _pausePlayVideo() {
    _isVideoPlay ? _videoController.pause() : _videoController.play();
    setState(() {
      _isVideoPlay = !_isVideoPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    (widget.snappedPageIndex == widget.currentIndex && _isVideoPlay)
        ? _videoController.play()
        : _videoController.pause();
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _InitializeVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GestureDetector(
                onTap: () => {_pausePlayVideo()},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_videoController),
                    IconButton(
                        onPressed: () => {_pausePlayVideo()},
                        icon: Icon(
                          Icons.play_arrow,
                          color:
                              Colors.white.withOpacity(_isVideoPlay ? 0 : 0.5),
                          size: 60,
                        ))
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/tiktok-loader.json',
                  fit: BoxFit.cover,
                ),
              );
            }
          }),
    );
  }
}
