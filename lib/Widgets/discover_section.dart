import 'package:flutter/material.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context, 0.2 * height),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 0.65 * height,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://picsum.photos/seed/{$index}/200/300'))),
                    ),
                  );
                })),
      ],
    );
  }

  _buildHeader(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: height - 8,
            width: height - 8,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(height)),
            child: Text(
              "#",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 24,
                  ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SundayBrunch",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Trending Hashtag",
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: height / 2,
            color: Colors.grey.shade300,
            padding: const EdgeInsets.only(left: 6),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  "2.5M",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 17,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
