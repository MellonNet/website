import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class IntegrationsPage extends StatelessWidget {
  const IntegrationsPage({super.key});

  @override
  Widget build(BuildContext context) => Title(
    title: "Mini-Ranks | MellonNet!",
    color: Colors.black,
    child: Scaffold(
      appBar: mlnAppBar(context: context, title: "Mini-Ranks"),
      body: ListView(
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
  );
}
