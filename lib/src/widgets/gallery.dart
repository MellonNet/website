import 'package:flutter/material.dart';
import "image.dart";

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryWidget> {
  final controller = CarouselController();
  double get aspectRatio => 858 / 868;

  List<(String, String)> get images => [
    ("assets/rank1_page.png", "Public pages have modules other users can interact with. Here is a networker who can help guide you through Rank 1"),
    ("assets/brickkeeper_page.png", "Characters from popular LEGO themes, like LEGO Universe, have their own pages and want to be your friend!"),
    ("assets/private_page.png", "Your private page is your personal hub!"),
    ("assets/mail_page.png", "Send mail to other players and networkers. Try sending some items to your friends, they'll appreciate it!"),
    ("assets/inventory_page.png", "Collect blueprints around the network to make new items and rank up!"),
    ("assets/page_builder.png", "Customize your page with all sorts of modules! Some yield items, others show off your creativity, and some do both!"),
  ];

  int index = 0;

  Duration get duration => Durations.medium1;
  Curve get curve => Easing.standardAccelerate;

  void update() {
    setState(() { });
    // controller.animateToItem(index, duration: duration, curve: curve);
  }

  void prev() {
    index--;
    if (index == -1) index = images.length - 1;
    update();
  }

  void next() {
    index++;
    if (index == images.length) index = 0;
    update();
  }

  void goTo(int value) {
    setState(() => index = value);
    update();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LimitedBox(
          maxHeight: 500,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: prev,
                icon: Icon(Icons.arrow_back),
                iconSize: 36,
              ),
              Flexible(
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: HtmlImage(images[index].$1, size: Size(858, 868)),
                ),
              ),
              IconButton(
                onPressed: next,
                icon: Icon(Icons.arrow_forward),
                iconSize: 36,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: Text(images[index].$2, textAlign: TextAlign.center,),
          ),
        ),
      ],
    ),
  );
}
