import 'package:flutter/material.dart';
import 'package:home_page/links.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import "utils.dart";

AppBar mlnAppBar(BuildContext context) => AppBar(
  backgroundColor: WidgetStateColor.fromMap({
    WidgetState.scrolledUnder: Color.fromARGB(255, 203, 217, 228),
    WidgetState.any: context.colorScheme.surface,
  }),
  title: Text("MellonNet"),
  actions: [
    for (final link in ExternalLink.all) Link(
      target: LinkTarget.blank,
      // uri: link.url,
      uri: Uri.parse(link.path),
      builder: (context, followLink) => IconButton(
        icon: Icon(link.icon),
        onPressed: followLink,
        tooltip: link.name,
      ),
    ),
    ElevatedButton(
      onPressed: () => launchUrl(mlnLink),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3173A5),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      child: Text("Play Now"),
    ),
    SizedBox(width: 8),
  ],
);
