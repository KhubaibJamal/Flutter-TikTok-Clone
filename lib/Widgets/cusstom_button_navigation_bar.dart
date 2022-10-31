import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/Pages/add_video_page.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar(
      {Key? key, required this.selectedPageIndex, required this.onIconTap})
      : super(key: key);
  final int selectedPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 14, fontWeight: FontWeight.w600);
    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buttonBarNavItem(0, 'Home', style, 'home'),
            _buttonBarNavItem(1, 'Discover', style, 'search'),
            _addVideoNavItem(barHeight, context),
            _buttonBarNavItem(3, 'Inbox', style, 'inbox'),
            _buttonBarNavItem(4, 'Profile', style, 'account'),
          ],
        ),
      ),
    );
  }

  _buttonBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;

    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(name)
          SvgPicture.asset(
            'assets/${isSelected ? '${iconName}_filled' : iconName}.svg',
            // 'assets/${isSelected ? iconName : iconName}.svg',
            color: iconAndTextColor,
            width: 22,
            height: 25,
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            label,
            style: textStyle.copyWith(color: iconAndTextColor),
          )
        ],
      ),
    );
  }

  _addVideoNavItem(double height, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return AddVideoButtonPage();
                }))
      },
      child: Container(
        height: height - 5,
        width: 48,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.redAccent]),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Container(
            height: height - 5,
            width: 44,
            decoration: BoxDecoration(
              color: selectedPageIndex == 0 ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add,
              // color: Colors.black,
              color: selectedPageIndex == 0 ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
