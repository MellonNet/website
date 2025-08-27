import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';
import 'package:url_launcher/link.dart';

import 'package:home_page/links.dart';

Widget drawer(BuildContext context) => Drawer(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "MellonNet",
                style: context.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              HtmlImage("assets/promo.webp", size: Size(833, 345)),
              Divider(),
              for (final page in InternalLink.pages) Link(
                uri: page.url,
                builder: (context, followLink) => ListTile(
                  title: Text(page.name),
                  onTap: followLink,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.gamepad_outlined),
                title: Text("Minigames"),
                dense: true,
              ),
              for (final page in InternalLink.minigames) Link(
                uri: page.url,
                builder: (context, followLink) => ListTile(
                  leading: Icon(Icons.launch),
                  title: Text(page.name),
                  onTap: followLink,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text("Resources"),
                dense: true,
              ),
              for (final page in ExternalLink.all) Link(
                uri: page.url,
                builder: (context, followLink) => ListTile(
                  leading: Icon(page.icon),
                  title: Text(page.name),
                  onTap: followLink,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text("© 2018-2025 The MellonNet Team"),
      ],
    ),
  ),
);

AppBar mlnAppBar({
  required BuildContext context,
  required String title,
}) => AppBar(
  title: Text(title),
  leading: context.isMobile ? null : Container(
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: HtmlImage("assets/echo.png", size: Size(202, 202)),
  ),
  actions: [
    if (!context.isMobile)
      for (final page in InternalLink.pages) Link(
        uri: page.url,
        builder: (context, followLink) => TextButton(
          onPressed: followLink,
          child: Text(page.name, style: context.textTheme.titleMedium),
        ),
      ),
    if (!context.isMobile)
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
      builder: (context, controller, child) => context.isMobile
        ? IconButton(
          icon: Icon(Icons.sports_esports),
          tooltip: "Minigames",
          onPressed: controller.open,
        )
        : OutlinedButton.icon(
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
