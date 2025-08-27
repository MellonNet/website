import 'package:flutter/material.dart';
import "image.dart";

typedef GalleryImage = (String, String);  // asset, caption

List<GalleryImage> get mlnImages => [
  ("assets/rank1_page.png", "Public pages have modules other users can interact with. Here is a networker who can help guide you through Rank 1"),
  ("assets/brickkeeper_page.png", "Characters from popular LEGO themes, like LEGO Universe, have their own pages and want to be your friend!"),
  ("assets/private_page.png", "Your private page is your personal hub!"),
  ("assets/mail_page.png", "Send mail to other players and networkers. Try sending some items to your friends, they'll appreciate it!"),
  ("assets/inventory_page.png", "Collect blueprints around the network to make new items and rank up!"),
  ("assets/page_builder.png", "Customize your page with all sorts of modules! Some yield items, others show off your creativity, and some do both!"),
];

List<GalleryImage> get minigameImages => [
  ("assets/robot-chronicles.png", "In The Robot Chronicles, Dr. Inferno has invaded LEGO City with his giant robot! The LEGO City emergency teams, LEGO Agents, and LEGO Racers have to team up to stop him."),
  ("assets/coast_guard.png", "A man has fallen into the river in LEGO City -- Hey! Save the citizens with the rescue copter and earn rewards in My Lego Network"),
  ("assets/construction.png", "Join the LEGO City Construction crew! Drive, jump, and even fly as you race to build more of the city"),
  ("assets/raanu.png", "Raanu and the Agori tribe of Vulcanus need your help! Meet other Bionicle characters and help bring peace to the tribes"),
];

class GalleryWidget extends StatefulWidget {
  final List<GalleryImage> images;
  final Size size;
  const GalleryWidget({
    required this.images,
    required this.size,
    super.key,
  });

  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryWidget> {
  int index = 0;
  List<GalleryImage> get images => widget.images;

  void update() => setState(() { });

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
                child: HtmlImage(images[index].$1, size: widget.size),
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
          child: SizedBox(
            width: widget.size.width,
            child: Text(images[index].$2, textAlign: TextAlign.center),
          ),
        ),
      ],
    ),
  );
}
