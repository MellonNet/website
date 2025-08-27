import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:url_launcher/url_launcher.dart";

import "package:home_page/links.dart";
export "src/pages/home.dart";
export "src/pages/integrations.dart";

import "";

GoRoute redirectRoute(String path, Uri url) => GoRoute(
  path: path,
  redirect: (context, state) {
    launchUrl(url, webOnlyWindowName: "_self");
    return "/";
  },
);

GoRoute normalPage(String path, Widget page) => GoRoute(
  path: path,
  pageBuilder: (context, state) => NoTransitionPage(child: page),
);

final router = GoRouter(
  initialLocation: "/",
  routes: [
    normalPage("/", HomePage()),
    normalPage("/mini-ranks", IntegrationsPage()),
    for (final link in ExternalLink.all)
      redirectRoute(link.path, link.url),
    // redirectRoute("/setup", Uri.parse(setupLink))
  ],
);
