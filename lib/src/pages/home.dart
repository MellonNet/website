import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Title(
    title: "Welcome to MellonNet!",
    color: Colors.black,
    child: Scaffold(
      appBar: mlnAppBar(context: context, title: "MellonNet"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset("assets/banner.webp")),
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
                GalleryWidget(),
                SizedBox(height: 12),
                Text("Questions & Answers", style: context.textTheme.headlineLarge),
                SizedBox(height: 12),
                ...topicList(context, faq(context)),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    ),
  );
}
