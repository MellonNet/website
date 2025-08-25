import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';
import 'package:url_launcher/link.dart';

typedef TopicLink = (String?, String);
Widget buildLink(BuildContext context, List children) => RichText(
  text: TextSpan(
    children: [
      for (final child in children)
        if (child is String)
          TextSpan(text: child, style: context.textTheme.bodyLarge)
        else if (child is TopicLink)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Link(
              target: LinkTarget.blank,
              uri: Uri.parse(child.$2),
              builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: Text(
                  child.$1 ?? child.$2,
                  style: context.textTheme.bodyLarge
                    ?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
    ],
  ),
);

typedef Topic = (String, dynamic);
List<Widget> topicList(BuildContext context, List<Topic> topics) => [
  for (final (question, answer) in topics) ...[
    Text(question, style: context.textTheme.headlineSmall),
    SizedBox(height: 8),
    if (answer is Widget)
      answer
    else
      SelectableText(answer, style: context.textTheme.bodyLarge),
    SizedBox(height: 24),
  ],
];
