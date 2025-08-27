import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

const inviteLink = "https://discord.gg/HXqF4aUZ3Y";
const wikiLink = "https://mylegonetwork.fandom.com/wiki/Welcome_to_My_LEGO_Network_Wiki!";
const githubLink = "https://github.com/MellonNet";
final mlnLink = Uri.parse("https://mln.mellonnet.com");
final setupLink = "https://www.reddit.com/r/FlashPlayerForever/comments/kp69ix/how_to_use_flash_player_after_january_12_2021/";

class ExternalLink {
  final IconData icon;
  final String name;
  final String path;
  final Uri url;

  ExternalLink({
    required this.icon,
    required this.name,
    required this.path,
    required String url,
  }) : url = Uri.parse(url);

  static final all = [
    ExternalLink(icon: Icons.install_desktop, path: "/setup", name: "Install Flash", url: setupLink),
    ExternalLink(icon: SimpleIcons.fandom, path: "/wiki", name: "Wiki", url: wikiLink),
    ExternalLink(icon: SimpleIcons.discord, path: "/discord", name: "Discord", url: inviteLink),
    ExternalLink(icon: SimpleIcons.github, path: "/github", name: "GitHub", url: githubLink),
  ];
}

class InternalLink {
  final String name;
  final Uri url;

  const InternalLink({
    required this.name,
    required this.url,
  });

  static final minigames = [
    InternalLink(name: "The Robot Chronicles", url: Uri.parse("https://robot-chronicles.mellonnet.com")),
    InternalLink(name: "LEGO City Coast Guard", url: Uri.parse("https://coast-guard.mellonnet.com")),
    InternalLink(name: "LEGO City Construction", url: Uri.parse("https://construction.mellonnet.com")),
  ];

  static final pages = [
    InternalLink(name: "Home", url: Uri.parse("/")),
    InternalLink(name: "Mini-Ranks", url: Uri.parse("/mini-ranks")),
  ];
}
