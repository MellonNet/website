import 'package:flutter/material.dart';
import 'package:home_page/links.dart';
import 'package:home_page/pages.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import "utils.dart";

List get minigames => [
  ("The Robot Chronicles", "https://robot-chronicles.mellonnet.com"),
  ("LEGO City Coast Guard", "https://coast-guard.mellonnet.com"),
  ("LEGO City Construction", "https://construction.mellonnet.com"),
];

AppBar mlnAppBar({
  required BuildContext context,
  required String title,
}) => AppBar(
  backgroundColor: WidgetStateColor.fromMap({
    WidgetState.scrolledUnder: Color.fromARGB(255, 203, 217, 228),
    WidgetState.any: context.colorScheme.surface,
  }),
  title: Text(title),
  actions: [
    TextButton(
      child: Text("Home", style: context.textTheme.titleMedium),
      onPressed: () => router.go("/"),
    ),
    TextButton(
      child: Text("Mini-Ranks", style: context.textTheme.titleMedium),
      onPressed: () => router.go("/mini-ranks"),
    ),
    for (final link in ExternalLink.all) Link(
      target: LinkTarget.blank,
      uri: Uri.parse(link.path),
      builder: (context, followLink) => IconButton(
        icon: Icon(link.icon),
        onPressed: followLink,
        tooltip: link.name,
      ),
    ),
    PopupMenuButton<String>(
      tooltip: "Minigames",
      icon: Icon(Icons.sports_esports),
      onSelected: (item) => launchUrl(Uri.parse(item)),
      itemBuilder: (context) => [
        for (final minigame in minigames)
          PopupMenuItem(
            value: minigame.$2,
            child: Text(minigame.$1),
          ),
      ],
    ),
    Link(
      uri: mlnLink,
      target: LinkTarget.blank,
      builder: (context, followLink) => ElevatedButton(
        onPressed: followLink,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3173A5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child: Text("Play Now"),
      ),
    ),
    SizedBox(width: 8),
  ],
);
