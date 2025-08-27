import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

import "scaffold.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) => MlnScaffold(
    title: "MellonNet",
    children: [
      Center(
        child: Text(
          "Welcome to MellonNet!",
          style: context.textTheme.headlineLarge,
        ),
      ),
      SizedBox(height: 12),
      Center(
        child: Text(
          "The fan-made, unofficial revival of My Lego Network",
          style: context.textTheme.titleLarge
        ),
      ),
      SizedBox(height: 12),
      GalleryWidget(images: mlnImages, size: Size(858, 868)),
      SizedBox(height: 12),
      ...topicList(context, faq(context)),
    ],
  );
}
