import "package:go_router/go_router.dart";
import "package:url_launcher/url_launcher.dart";

import "package:home_page/links.dart";
export "src/pages/home.dart";

import "";

GoRoute redirectRoute(String path, Uri url) => GoRoute(
  path: path,
  redirect: (context, state) {
    launchUrl(url);
    return "/";
  },
);

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
    ),
    for (final link in ExternalLink.all)
      redirectRoute(link.path, link.url),
    redirectRoute("/setup", Uri.parse(setupLink))
  ],
);
