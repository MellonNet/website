
import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';
import 'package:url_launcher/link.dart';

typedef LinkTuple = (String, String);

Widget buildLink(BuildContext context, List children) => RichText(
  text: TextSpan(
    children: [
      for (final child in children)
        if (child is String)
          TextSpan(text: child, style: context.textTheme.bodyLarge)
        else if (child is LinkTuple)
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Link(
              uri: Uri.parse(child.$2),
              builder: (context, followLink) => InkWell(
                onTap: followLink,
                child: Text(
                  child.$1,
                  style: context.textTheme.bodyLarge
                    ?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
    ],
  ),
);

List faq(BuildContext context) => [
  (
    "What is My Lego Network?",
    "My Lego Network was a social media / game hybrid released by the LEGO Group in 2008. Characters from iconic LEGO themes had their own pages, including LEGO Bionicle, LEGO Agents, LEGO City, and more. You could make your own page to show off your creations and interact with other users -- humans or NPC \"networkers\" -- to collect items and rank up. Each rank came with new friends, new items, and new modules to put on your page. Eventually, you'd get the items you needed to build a masterpiece and advance to the next rank.",
  ),
  (
    "What is MellonNet?",
    "MellonNet is a fan-made, unofficial revival of the My Lego Network. Our name comes from trying to pronounce the acronym, MLN. Before the original site shut down in 2015, the Wayback Machine managed to save all of the original Flash assets. All that was needed was a new server, and so we set out to make one! Our server runs using Django, a popular Python web server framework. Work started in around 2018 and the game was finally playable in full in 2023, thanks to hard work from our team and community."
  ),
  (
    "How do I play?",
    buildLink(context, [
      "My Lego Network is a Flash game, so you'll need to set up Flash and a compatible browser. See ",
      ("this Reddit thread", "/setup"),
      " for more details. Note that MellonNet has known problems with Ruffle, so we don't recommend using that at this time. ",
      "Once you have your Flash-compatible browser set up, head over to ",
      ("https://mln.mellonnet.com", "https://mln.mellonnet.com"),
      " or press the \"Play Now\" button at the top."
    ])
  ),
  (
    "Where can I learn more about My Lego Network?",
    buildLink(context, [
      "The ",
      ("My Lego Network Wiki", "/wiki"),
      " on Fandom is an amazing source of information, and we are very grateful to the community for providing such a fantastic resource. The wiki has information on all networkers, items, modules, and more, with complete walkthroughs for every rank and mini-rank. To talk to other MellonNet players, ",
      ("join our Discord!", "/discord"),
    ]),
  ),
  (
    "How is MellonNet balanced?",
    "My Lego Network relied on the community to help each other progress through the ranks. In other words, it was not possible to progress by interacting only with the NPC networkers. Since item costs were balanced around the much larger community at the time, we've added our own re-balancing, in the form of \"pseudo-networkers\". Each rank has a dedicated networker whose only purpose is to provide the same modules a human player at that rank would have. Interacting with their page causes them to interact with yours in return, just like a real friend would!",
  ),
  (
    "What's the current state of MellonNet?",
    "The original content of MellonNet has been restored, meaning you can progress from Rank 0 all the way to Rank 10. You can also upload pictures to show off on your page. However, the network is no longer as inter-connected with other LEGO sites as it used to be. For example, clicking on hidden easter eggs on a LEGO Bionicle product page would present rewards in MLN. But Bionicle was discontinued, and their product pages no longer exist. Instead, we are focusing on other Flash-based minigames that integrated with MLN, with workarounds for the integrations we cannot support.",
  ),
  (
    "What's next for MellonNet?",
    "We have some exciting new developments, including reviving more of the Flash minigames that integrated with MLN, a potential collaboration with Lego Universe revival efforts, adding Ruffle support, and even a Discord bot for our community!",
  ),
];
