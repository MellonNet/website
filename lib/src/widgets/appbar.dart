import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'package:home_page/links.dart';
import "utils.dart";

AppBar mlnAppBar({
  required BuildContext context,
  required String title,
}) => AppBar(
  title: Text(title),
  leading: Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(image: AssetImage("assets/echo.png")),
    ),
  ),
  actions: [
    for (final page in InternalLink.pages) Link(
      uri: page.url,
      builder: (context, followLink) => TextButton(
        onPressed: followLink,
        child: Text(page.name, style: context.textTheme.titleMedium),
      ),
    ),
    for (final link in ExternalLink.all) Link(
      target: LinkTarget.blank,
      uri: link.url,
      builder: (context, followLink) => IconButton(
        icon: Icon(link.icon),
        onPressed: followLink,
        tooltip: link.name,
      ),
    ),
    const SizedBox(width: 4),
    MenuAnchor(
      builder: (context, controller, child) => OutlinedButton.icon(
        label: Text("Minigames"),
        iconAlignment: IconAlignment.end,
        onPressed: () => controller.open(),
        icon: Icon(Icons.arrow_drop_down),
      ),
      menuChildren: [
        for (final minigame in InternalLink.minigames) Link(
          target: LinkTarget.blank,
          uri: minigame.url,
          builder: (context, followLink) => ListTile(
            title: Text(minigame.name, style: context.textTheme.bodyMedium),
            onTap: followLink,
          ),
        ),
      ],
    ),
    SizedBox(width: 4),
    Link(
      uri: mlnLink,
      target: LinkTarget.blank,
      builder: (context, followLink) => ElevatedButton(
        onPressed: followLink,
        child: Text("Play Now"),
      ),
    ),
    SizedBox(width: 8),
  ],
);
