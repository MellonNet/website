import 'package:flutter/material.dart';
import 'package:home_page/links.dart';
import 'package:url_launcher/link.dart';
import "utils.dart";

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
    // TextButton(
    //   child: Text("Home", style: context.textTheme.titleMedium),
    //   onPressed: () => router.go("/"),
    // ),
    for (final link in ExternalLink.all) Link(
      target: LinkTarget.blank,
      uri: Uri.parse(link.path),
      builder: (context, followLink) => IconButton(
        icon: Icon(link.icon),
        onPressed: followLink,
        tooltip: link.name,
      ),
    ),
    Link(
      uri: mlnLink,
      // onPressed: () => launchUrl(mlnLink),
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
