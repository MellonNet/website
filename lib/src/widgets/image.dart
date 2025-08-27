import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

bool get needsWorkaround =>
  // web.window.navigator.userAgent.contains("Basilisk");
  true;

class HtmlImage extends StatelessWidget {
  final String assetPath;
  final Size size;
  const HtmlImage(this.assetPath, {required this.size, super.key});

  @override
  Widget build(BuildContext context) => needsWorkaround
    ? ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height),
      child: AspectRatio(
        aspectRatio: size.aspectRatio,
        child: HtmlElementView.fromTagName(
          key: ValueKey(assetPath),
          tagName: "img",
          onElementCreated: (element) => (element as web.HTMLImageElement)
            .setAttribute("src", "/assets/$assetPath"),
        ),
      ),
    )
    : Image.asset(assetPath);
}
