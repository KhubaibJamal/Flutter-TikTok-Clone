import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/main.dart';

class AddVideoButtonPage extends StatefulWidget {
  const AddVideoButtonPage({Key? key}) : super(key: key);

  @override
  State<AddVideoButtonPage> createState() => _AddVideoButtonPageState();
}

class _AddVideoButtonPageState extends State<AddVideoButtonPage> {
  CameraController _cameraController =
      CameraController(cameras.first, ResolutionPreset.medium);
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.2);

  int _selectTab = 1;

  @override
  void initState() {
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Column(
        children: [
          if (_cameraController.value.isInitialized) _buildCameraPreview(),
          // _buildCameraPreview(),
          const Spacer(),
          Container(
            height: 90,
            color: Colors.black,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height - 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CameraPreview(_cameraController),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 24, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.pop(context),
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.0),
                            child: Icon(
                              CupertinoIcons.music_note_2,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Add Music",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconWithText('flip', 'Flip', 20, style),
                          _buildIconWithText('beauty', 'Beauty', 20, style),
                          _buildIconWithText('filter', 'Filter', 20, style),
                          _buildIconWithText('flash', 'Flash', 20, style),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _buildCameraTypeSelector(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 30, right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconWithText(
                        'effects', 'Effects', 40, style.copyWith(fontSize: 11)),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CircleAvatar(
                          backgroundColor: Colors.white, radius: 30),
                    ),
                    _buildIconWithText(
                        'upload', 'Upload', 40, style.copyWith(fontSize: 11)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCameraTypeSelector() {
    final List<String> cameraType = ["Photo", "Video"];

    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 65,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          height: 45,
          child: PageView.builder(
              controller: _pageController,
              itemCount: cameraType.length,
              itemBuilder: ((context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: Text(cameraType[index],
                      style: style.copyWith(color: Colors.white)),
                );
              })),
        ),
      ],
    );
  }

  Widget _buildIconWithText(
      String icon, String label, double size, TextStyle style) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/$icon.svg',
          height: size,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label, style: style)
      ],
    );
  }

  Widget _buildCameraTemplateSelector() {
    final List<String> postType = ["Camera", "Quick", "Templates"];

    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 45,
          child: PageView.builder(
              onPageChanged: (int page) => {
                    setState(() {
                      _selectTab = page;
                    })
                  },
              controller: _pageController,
              itemCount: postType.length,
              itemBuilder: ((context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  child: Text(postType[index],
                      style: style.copyWith(
                          color: _selectTab == index
                              ? Colors.white
                              : Colors.grey)),
                );
              })),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: 50,
          height: 45,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 2.5,
          ),
        ),
      ],
    );
  }
}
