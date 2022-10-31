import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_clone/Models/video.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@ ${video.postBy.userName}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ExpandableText(
            video.caption,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.w100),
            expandText: "more",
            collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                CupertinoIcons.music_note_2,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width / 2,
                child: Marquee(
                  text: "${video.audioName}        .    ",
                  velocity: 10,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
