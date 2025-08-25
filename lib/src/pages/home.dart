
import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Title(
    title: "Welcome to MellonNet!",
    color: Colors.black,
    child: Scaffold(
      appBar: mlnAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
          Row(
            children: [
              Expanded(child: Image.asset("assets/echo_page.png")),
              SizedBox(width: 12),
              Expanded(child: Image.asset("assets/private_page.png")),
            ],
          ),
          SizedBox(height: 12),
          Text("Questions & Answers", style: context.textTheme.headlineLarge),
          SizedBox(height: 12),
          for (final (question, answer) in faq(context)) ...[
            Text(question, style: context.textTheme.headlineSmall),
            SizedBox(height: 8),
            if (answer is Widget)
              answer
            else
              SelectableText(answer, style: context.textTheme.bodyLarge),
            SizedBox(height: 24),
          ],
        ],
      ),
    ),
  );
}
