import 'package:flutter/widgets.dart';
import 'package:home_page/widgets.dart';

TopicLink networker(String name) =>
  (name, "https://mln.mellonnet.com/mln/public_view/$name");

List networkers(List<String> names) => [
  for (final (index, name) in names.indexed) ...[
    networker(name),
    if (index == names.length - 1) ""
    else if (index == names.length - 2) ", and "
    else ", "
  ],
];

List<Topic> integrations(BuildContext context) => [
  (
    "What are mini-ranks?",
    "The normal progression of the game is to befriend new networkers, create new items, put up new modules, and eventually, craft a masterpiece to get to the next rank. Each rank centers around a unique theme, but all the content (networkers, items, modules, etc) are custom made for My Lego Network. A mini-rank, on the other hand, uses an existing theme or brand, and requires some progression external to MLN. For example, the Bionicle mini-rank is themed around LEGO Bionicle products, and progression involves collecting items on the LEGO product pages. Some mini-ranks just give a badge and maybe some helpful items instead of a whole story",
  ),
  (
    "Does MellonNet support mini-ranks?",
    "We'd like to! Unfortunately, we can't emulate everything, like buying a subscription to LEGO Club Magazine. For these mini-ranks, send a winky face message -- ;) -- to the right networker to start the campaign. Other mini-ranks were based on progress in a different game. We've managed to recover and revive those games as well, and restored the MLN integration. For specific mini-ranks, keep reading.",
  ),
  (
    "Supported Minigames",
    buildLink(context, [
      "Some mini-ranks were tied to progression in other Flash-based minigames. We've revived some of them as part of MellonNet. You'll need ",
      ("a Flash-enabled browser", "/setup"),
      " to play (Ruffle not yet supported). After finishing a mission, you'll be prompted to sign into MLN, and your reward will be sent to your inbox. To start playing, click on the minigames button in the top menu",
    ]),
  ),
  (
    "Unsupported Minigames",
    buildLink(context, [
      "The following minigames are not supported yet but may be supported one day. For now, send a winky message to their respective networkers:\n",
      "- Dice Quest: ",
      networker("Stanley Brick"),
      "\n"
      "- LEGO Universe: ",
      networker("Prof Brickkeeper"),
    ]),
  ),
  (
    "LEGO Club",
    buildLink(context, [
      "- LEGO Club Magazine: Required a paid subscription. Send a winky to ", networker("Max"), " instead\n",
      "- Old Timer Badge: Required a (discontinued) LEGO Club Page. Send a winky to ", networker("Dusty"), " instead\n",
      "- S.P.A: Required a Club Page and an MLN page. Send a winky to ",
      ...networkers(["Patty Arch", "Nora Stalgia", "Zapp Chance", "Dusty"]),
      "\n",
      "- Kanoka Club Badge: Required the Kanoka Club Award on your Club Page. Send a winky to ",
      networker("Whenua"),
    ]),
  ),
  (
    "Discontinued products",
      buildLink(context, [
        "- Bionicle: Send a winky to ",
        ...networkers(["Raanu", "Tarix", "Berix"]),
        "\n"
        "- Star Justice: Send a winky to ",
        networker("Capt Reynolds"),
      ])
  ),
  (
    "Beta programs",
    buildLink(context, [
      "- MLN Beta: This badge is reserved for members of the community that helped play-test MellonNet\n"
      "- LEGO Racers Beta: Send a winky to ", networker("Pedalman Wheelie"),
    ]),
  ),
  (
    "Real-World Events",
    "Badges or items given to participants of real-world events are not recreated in MellonNet. This includes all the \"LEGO Badges\" on the wiki"
  ),
  (
    "Custom Content",
    "Now that MellonNet is stable, the question of custom content is back on the table. If you have ideas, join the Discord! For now, a LEGO City Undercover mini-rank is in the works...",
  )
];
