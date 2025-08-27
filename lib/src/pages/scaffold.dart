import 'package:auto_scrolling/auto_scrolling.dart';
import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class MlnScaffold extends StatefulWidget {
  final List<Widget> children;
  final String title;
  const MlnScaffold({
    required this.children,
    required this.title,
    super.key,
  });

  @override
  State<MlnScaffold> createState() => _MlnScaffoldState();
}

class _MlnScaffoldState extends State<MlnScaffold> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => Title(
    title: widget.title,
    color: Colors.black,
    child: Scaffold(
      drawer: context.isMobile ? drawer(context) : null,
      appBar: mlnAppBar(context: context, title: widget.title),
      body: AutoScroll(
        controller: controller,
        anchorBuilder: (context) => SingleDirectionAnchor(),
        cursorBuilder: (direction) => switch (direction) {
          AutoScrollDirection.none => null,
          _ => DirectionArrow(direction: direction),
        },
        scrollTick: 5,
        child: ListView(
          controller: controller,
          cacheExtent: double.infinity,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1250),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: HtmlImage("assets/banner.webp", size: Size(922, 157))),
                      ...widget.children,
                    ],
                  ),
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    ),
  );
}
