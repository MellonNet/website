import 'package:flutter/material.dart';
import 'package:home_page/src/pages/scaffold.dart';
import 'package:home_page/widgets.dart';

class IntegrationsPage extends StatefulWidget {
  const IntegrationsPage({super.key});

  @override
  State<IntegrationsPage> createState() => _IntegrationsPageState();
}

class _IntegrationsPageState extends State<IntegrationsPage> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => MlnScaffold(
    title: "Mini-Ranks",
    children: [
      Center(
        child: Text(
          "Mini-Ranks and Badges",
          style: context.textTheme.headlineLarge,
        ),
      ),
      SizedBox(height: 12),
      GalleryWidget(images: minigameImages, size: Size(500, 400)),
      SizedBox(height: 12),
      ...topicList(context, integrations(context)),
    ],
  );
}
