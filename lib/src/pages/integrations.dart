import 'package:auto_scrolling/auto_scrolling.dart';
import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class IntegrationsPage extends StatefulWidget {
  const IntegrationsPage({super.key});

  @override
  State<IntegrationsPage> createState() => _IntegrationsPageState();
}

class _IntegrationsPageState extends State<IntegrationsPage> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => Title(
    title: "Mini-Ranks | MellonNet!",
    color: Colors.black,
    child: Scaffold(
      appBar: mlnAppBar(context: context, title: "Mini-Ranks"),
      body: AutoScroll(
        controller: controller,
        anchorBuilder: (context) => SingleDirectionAnchor(),
        child: ListView(
          controller: controller,
          cacheExtent: double.infinity,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset("assets/banner.webp")),
                  ...topicList(context, integrations(context)),
                ],
              ),
            ),
              Footer(),
          ],
        ),
      ),
    ),
  );
}
