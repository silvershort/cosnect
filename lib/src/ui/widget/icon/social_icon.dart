import 'package:cosnect/src/model/form/coser_model.dart';
import 'package:cosnect/src/model/social_icon_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.socialIconType, this.size = 24});

  final SocialIconType socialIconType;
  final double size;

  factory SocialIcon.x() {
    return const SocialIcon(
      socialIconType: SocialIconType.x,
    );
  }

  factory SocialIcon.instagram() {
    return const SocialIcon(
      socialIconType: SocialIconType.instagram,
    );
  }

  factory SocialIcon.mail() {
    return const SocialIcon(
      socialIconType: SocialIconType.email,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double padding = size / 6;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switch (socialIconType) {
          SocialIconType.x => Colors.black,
          SocialIconType.instagram => Colors.pink,
          SocialIconType.email => Theme.of(context).colorScheme.primary,
        },
      ),
      child: switch (socialIconType) {
        SocialIconType.x => SvgPicture.asset(
          'assets/logo/x.svg',
          width: size,
          height: size,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        SocialIconType.instagram => SvgPicture.asset(
          'assets/logo/instagram.svg',
          width: size,
          height: size,
        ),
        SocialIconType.email => FittedBox(
          child: Icon(
            FontAwesomeIcons.envelope,
            size: size,
            color: Colors.white,
          ),
        ),
      },
    );
  }
}
