import "package:go_router/go_router.dart";
import "package:url_launcher/url_launcher.dart";

import "package:home_page/links.dart";
export "src/pages/home.dart";

import "";

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
    ),
    for (final link in ExternalLink.all) GoRoute(
      path: link.path,
      redirect: (context, state) {
        launchUrl(link.url);
        return "/";
      },
    ),
  ],
);
