import 'package:flutter/material.dart';
import 'package:tiktok_clone/Widgets/home_side_bar.dart';
import 'package:tiktok_clone/Widgets/video_detail.dart';
import 'package:tiktok_clone/Widgets/video_tile.dart';
import 'package:tiktok_clone/_mock_data/mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFollowingSelected = true;

  int _snappedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollowingSelected = true;
                })
              },
              child: Text("Following",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: _isFollowingSelected ? 18 : 14,
                      color:
                          _isFollowingSelected ? Colors.white : Colors.grey)),
            ),
            Text("   |   ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: Colors.grey)),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollowingSelected = false;
                })
              },
              child: Text("For you",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: !_isFollowingSelected ? 18 : 14,
                      color:
                          !_isFollowingSelected ? Colors.white : Colors.grey)),
            ),
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (int page) => {
          setState(() {
            _snappedPageIndex = page;
          }),
          print("Page $page")
        },
        scrollDirection: Axis.vertical,
        itemCount: Videos.length,
        itemBuilder: ((context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoTile(
                video: Videos[index],
                currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: VideoDetail(
                          video: Videos[index],
                        ),
                      )),
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height / 1.75,
                    child: HomeSideBar(
                      video: Videos[index],
                    ),
                  )),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
