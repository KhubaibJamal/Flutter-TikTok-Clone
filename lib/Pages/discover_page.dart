import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:tiktok_clone/Widgets/discover_section.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage,
          duration: const Duration(microseconds: 400), curve: Curves.ease);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0.25,
          pinned: true,
          centerTitle: false,
          title: Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(2)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.grey.shade200,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                  border: InputBorder.none,
                  prefixIcon:
                      const Icon(CupertinoIcons.search, color: Colors.black)),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.qrcode_viewfinder,
                  color: Colors.black,
                ))
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) =>
                      {_currentPageNotifier.value = page},
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1611605698323-b1e99cfd37ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'))),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CirclePageIndicator(
                    currentPageNotifier: _currentPageNotifier,
                    itemCount: 5,
                    size: 5,
                    selectedSize: 5,
                  ),
                )
              ],
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height / 3.75,
                // color: Colors.amber,
                child: DiscoverSection(
                  height: MediaQuery.of(context).size.height / 3.75,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
