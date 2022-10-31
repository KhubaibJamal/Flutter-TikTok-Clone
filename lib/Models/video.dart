import 'package:tiktok_clone/Models/user.dart';

class Video {
  final String videoURL;
  final User postBy;
  final String caption;
  final String audioName;
  final String likes;
  final String comments;

  Video(this.videoURL, this.postBy, this.caption, this.audioName, this.likes,
      this.comments);
}
