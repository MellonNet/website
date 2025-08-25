import 'package:flutter/material.dart';
import 'package:home_page/widgets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  String get text =>
    "Copyright © 2018-2025 The MellonNet Team. For license details, see our GitHub repositories\n\n"
    "Disclaimer: LEGO® is a trademark of the LEGO Group of companies which does not sponsor, authorize or endorse this site, and is not liable for any safety issues in relation to its operation. No profit is being derived from this project, it is simply a restoration for restoration's sake, to enable players to play the games they grew up with. "
    "The operation of this project follows existing precedents and guidelines set by the LEGO Group (and other organizations) in relation to fan projects and abandonware (including the existance of other such projects). Should any party with claim to the intellectual property used in this project have issue with its operation, please contact us immediately and we will take action as soon as possible to resolve, or ultimately remove this project if necessary.";

  @override
  Widget build(BuildContext context) => Container(
    color: Color(0xff3173A5),
    // height: 125,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: SelectableText(
        text,
        style: context.textTheme.labelLarge?.copyWith(color: Colors.white),
      ),
    ),
  );
}
